import { Body, Controller, Get, Param, Patch, Post } from '@nestjs/common';
import { RegisterUserDto } from '../../dtos/auths/register-user.dto';
import { LoginUserDto } from '../../dtos/auths/login-user.dto';
import { AuthService } from './auth.service';

@Controller('auth/users')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('/register')
  registerUser(@Body() registerUserDto: RegisterUserDto) {
    return this.authService.create(registerUserDto);
  }

  @Post('/login')
  loginUser(@Body() loginUserDto: LoginUserDto) {
    return this.authService.findOne(loginUserDto);
  }

  @Get('/coba')
  test() {
    return this.authService.testing();
  }
}
