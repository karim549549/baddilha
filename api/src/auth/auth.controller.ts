import { Controller, Post } from '@nestjs/common';
import { AuthService } from './auth.service';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}
  // =================================================================
  // == Social Logins (OAuth 2.0)
  // =================================================================

  // --- Google ---
  // @Get('google')
  // @UseGuards(AuthGuard('google'))
  // async googleAuth(@Req() req) { /* Redirects to Google */ }

  // @Get('google/callback')
  // @UseGuards(AuthGuard('google'))
  // googleAuthRedirect(@Req() req, @Res() res: Response) { /* Handle callback, issue JWT */ }

  // --- Facebook ---
  // @Get('facebook')
  // @UseGuards(AuthGuard('facebook'))
  // async facebookAuth(@Req() req) { /* Redirects to Facebook */ }

  // @Get('facebook/callback')
  // @UseGuards(AuthGuard('facebook'))
  // facebookAuthRedirect(@Req() req, @Res() res: Response) { /* Handle callback, issue JWT */ }

  // --- Twitter/X ---
  // @Get('twitter')
  // @UseGuards(AuthGuard('twitter'))
  // async twitterAuth(@Req() req) { /* Redirects to Twitter */ }

  // @Get('twitter/callback')
  // @UseGuards(AuthGuard('twitter'))
  // twitterAuthRedirect(@Req() req, @Res() res: Response) { /* Handle callback, issue JWT */ }

  // --- Discord ---
  // @Get('discord')
  // @UseGuards(AuthGuard('discord'))
  // async discordAuth(@Req() req) { /* Redirects to Discord */ }

  // @Get('discord/callback')
  // @UseGuards(AuthGuard('discord'))
  // discordAuthRedirect(@Req() req, @Res() res: Response) { /* Handle callback, issue JWT */ }

  // --- Apple ---
  // @Get('apple')
  // @UseGuards(AuthGuard('apple'))
  // async appleAuth(@Req() req) { /* Redirects to Apple */ }

  // @Get('apple/callback')
  // @UseGuards(AuthGuard('apple'))
  // appleAuthRedirect(@Req() req, @Res() res: Response) { /* Handle callback, issue JWT */ }

  // =================================================================
  // == Passkeys (WebAuthn)
  // =================================================================

  /**
   * Generates registration options for creating a new passkey.
   * The frontend will use this to call navigator.credentials.create().
   */
  @Post('passkey/register-options')
  async getPasskeyRegistrationOptions() {
    // For now, we'll use a mock user. In a real app, this would come from the session.
    const user = { id: 'mock-user-id', username: 'mock-user' };
    return this.authService.generateRegistrationOptions(user);
  }

  /**
   * Verifies the registration response from the client.
   * The frontend calls this after navigator.credentials.create() is successful.
   */
  // @Post('passkey/verify-registration')
  // async verifyPasskeyRegistration(@Req() req) {
  //   // 1. Get user and challenge from session/cache
  //   // 2. Get registration response from request body
  //   // 3. Verify the response using a WebAuthn library
  //   // 4. If valid, save the new public key credential to the user's record in the DB
  // }

  /**
   * Generates authentication options for logging in with a passkey.
   * The frontend will use this to call navigator.credentials.get().
   */
  // @Post('passkey/login-options')
  // async getPasskeyLoginOptions(@Req() req) {
  //   // 1. Get user identifier from request body (e.g., email)
  //   // 2. Generate WebAuthn authentication options
  //   // 3. Store challenge in session/cache
  //   // 4. Return options to the client
  // }

  /**
   * Verifies the authentication response from the client.
   * The frontend calls this after navigator.credentials.get() is successful.
   */
  // @Post('passkey/verify-login')
  // async verifyPasskeyLogin(@Req() req) {
  //   // 1. Get challenge from session/cache
  //   // 2. Get authentication response from request body
  //   // 3. Verify the response using the user's stored public key
  //   // 4. If valid, issue a JWT token
  // }
}
