import { Controller, Get, InternalServerErrorException } from '@nestjs/common';
import { BlobService } from './blob.service';

@Controller('blob')
export class BlobController {
  constructor(private readonly blobService: BlobService) {}

  @Get('health-check')
  async healthCheck(): Promise<string> {
    const testFilePath = `test-files/health-check-${Date.now()}.txt`;
    const testFolderPrefix = `test-folder-${Date.now()}/`;
    const testFileContent = 'This is a health check test file.';
    const testFileBuffer = Buffer.from(testFileContent);
    const testMimeType = 'text/plain';

    let result = 'Blob Service Health Check:\n';

    try {
      // 1. Test uploadFile
      result += `Attempting to upload file to: ${testFilePath}\n`;
      const uploadedUrl = await this.blobService.uploadFile(
        testFilePath,
        testFileBuffer,
        testMimeType,
      );
      result += `Upload successful. Public URL: ${uploadedUrl}\n`;

      // 2. Test getSignedUrl
      result += `Attempting to get signed URL for: ${testFilePath}\n`;
      const signedUrl = await this.blobService.getSignedUrl(testFilePath, 60); // Valid for 60 seconds
      result += `Signed URL successful: ${signedUrl.substring(0, 50)}...\n`; // Truncate for display

      // 3. Test deleteFile
      result += `Attempting to delete file: ${testFilePath}\n`;
      await this.blobService.deleteFile(testFilePath);
      result += `Delete file successful.\n`;

      // 4. Test deleteFolder (create a dummy file in a dummy folder first)
      const dummyFilePathInFolder = `${testFolderPrefix}dummy.txt`;
      await this.blobService.uploadFile(
        dummyFilePathInFolder,
        Buffer.from('dummy'),
        'text/plain',
      );
      result += `Uploaded dummy file to ${dummyFilePathInFolder} for folder deletion test.\n`;

      result += `Attempting to delete folder: ${testFolderPrefix}\n`;
      await this.blobService.deleteFolder(testFolderPrefix);
      result += `Delete folder successful.\n`;

      result += '\nAll Blob Service functions tested successfully!';
      return result;
    } catch (error) {
      console.error('Blob Service Health Check Failed:', error);
      throw new InternalServerErrorException(
        `Blob Service Health Check Failed: ${
          error instanceof Error ? error.message : error
        }`,
      );
    }
  }
}
