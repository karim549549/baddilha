import { Injectable } from '@nestjs/common';
import { generateRegistrationOptions } from '@simplewebauthn/server';
import type { GenerateRegistrationOptionsOpts } from '@simplewebauthn/server';

@Injectable()
export class AuthService {
  // In-memory store for challenges. In a real app, use a cache like Redis.
  private challenges = new Map<string, string>();

  async generateRegistrationOptions(user: { id: string; username: string }) {
    const options: GenerateRegistrationOptionsOpts = {
      rpName: 'Baddliha',
      rpID: 'localhost', // This should be your domain in production
      userID: Buffer.from(user.id, 'utf8'),
      userName: user.username,
      attestationType: 'none', // 'none' is simplest, 'direct' or 'indirect' are more secure
      excludeCredentials: [], // Add existing credentials to prevent re-registration
      authenticatorSelection: {
        residentKey: 'preferred',
        userVerification: 'preferred',
      },
    };

    const registrationOptions = await generateRegistrationOptions(options);

    // Store the challenge to verify it later
    this.challenges.set(user.id, registrationOptions.challenge);

    return registrationOptions;
  }
}
