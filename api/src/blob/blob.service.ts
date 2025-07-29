import { Injectable, InternalServerErrorException } from '@nestjs/common';
import { createClient, SupabaseClient } from '@supabase/supabase-js';
import { ConfigService } from '@nestjs/config'; // Assuming @nestjs/config is used for environment variables

@Injectable()
export class BlobService {
  private supabase: SupabaseClient;
  private readonly bucketName: string;

  // Supabase Storage Architecture:
  // - Single bucket (e.g., 'baddliha-assets') for all assets.
  // - Organized using prefixes (folders):
  //   - 'profile-pictures/{userId}/{filename}'
  //   - 'item-photos/{itemId}/{filename}'
  // - All buckets are private. Access is granted via signed URLs.

  constructor(private configService: ConfigService) {
    const supabaseUrl = this.configService.get<string>('SUPABASE_URL');
    const supabaseServiceRoleKey = this.configService.get<string>(
      'SUPABASE_SERVICE_ROLE_KEY',
    );

    if (!supabaseUrl || !supabaseServiceRoleKey) {
      throw new InternalServerErrorException(
        'Supabase credentials not found in environment variables.',
      );
    }

    this.supabase = createClient(supabaseUrl, supabaseServiceRoleKey, {
      auth: {
        persistSession: false, // Important for server-side
      },
    });
    this.bucketName = 'baddliha'; // Or whatever you name your single bucket
  }

  /**
   * Uploads a file to the specified path within the bucket.
   * @param filePath The full path within the bucket (e.g., 'profile-pictures/userId/filename.jpg').
   * @param fileBuffer The buffer of the file to upload.
   * @param mimetype The MIME type of the file.
   * @returns The public URL of the uploaded file (Supabase provides this directly).
   */
  async uploadFile(
    filePath: string,
    fileBuffer: Buffer,
    mimetype: string,
  ): Promise<string> {
    const { error } = await this.supabase.storage
      .from(this.bucketName)
      .upload(filePath, fileBuffer, {
        contentType: mimetype,
        upsert: true, // Overwrite if file exists
      });

    if (error) {
      throw new InternalServerErrorException(
        `Failed to upload file: ${error.message}`,
      );
    }

    // Supabase returns the path, we need to construct the public URL
    const { data: publicUrlData } = this.supabase.storage
      .from(this.bucketName)
      .getPublicUrl(filePath);

    return publicUrlData.publicUrl;
  }

  /**
   * Generates a signed URL for a private file, allowing temporary access.
   * @param filePath The full path within the bucket (e.g., 'item-photos/itemId/filename.png').
   * @param expiresInSeconds The duration in seconds for which the URL will be valid.
   * @returns The signed URL.
   */
  async getSignedUrl(
    filePath: string,
    expiresInSeconds: number,
  ): Promise<string> {
    const { data, error } = await this.supabase.storage
      .from(this.bucketName)
      .createSignedUrl(filePath, expiresInSeconds);

    if (error) {
      throw new InternalServerErrorException(
        `Failed to generate signed URL: ${error.message}`,
      );
    }
    return data.signedUrl;
  }

  /**
   * Deletes a single file from the bucket.
   * @param filePath The full path within the bucket (e.g., 'profile-pictures/userId/old_avatar.jpg').
   */
  async deleteFile(filePath: string): Promise<void> {
    const { error } = await this.supabase.storage
      .from(this.bucketName)
      .remove([filePath]);

    if (error) {
      throw new InternalServerErrorException(
        `Failed to delete file: ${error.message}`,
      );
    }
  }

  /**
   * Deletes all files within a specific prefix (effectively a folder).
   * Note: Supabase storage doesn't have a direct 'delete folder' API.
   * We list files and then delete them. This might be slow for very large folders.
   * @param prefix The prefix to delete (e.g., 'item-photos/itemId/').
   */
  async deleteFolder(prefix: string): Promise<void> {
    const { data: files, error: listError } = await this.supabase.storage
      .from(this.bucketName)
      .list(prefix, {
        // You might need to adjust limit and pagination for very large folders
        limit: 100, // Adjust as needed
      });

    if (listError) {
      throw new InternalServerErrorException(
        `Failed to list files for deletion: ${listError.message}`,
      );
    }

    if (files && files.length > 0) {
      const filePaths = files.map((file) => `${prefix}${file.name}`);
      const { error: removeError } = await this.supabase.storage
        .from(this.bucketName)
        .remove(filePaths);

      if (removeError) {
        throw new InternalServerErrorException(
          `Failed to delete files in folder: ${removeError.message}`,
        );
      }
    }
  }
}
