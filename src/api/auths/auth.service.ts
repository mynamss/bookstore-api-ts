import { Injectable } from '@nestjs/common';
import { RegisterUserDto } from '../../dtos/auths/register-user.dto';
import { LoginUserDto } from './../../dtos/auths/login-user.dto';

@Injectable()
export class AuthService {
  create(registerUserDto: RegisterUserDto) {
    return registerUserDto;
  }

  findOne(loginUserDto: LoginUserDto) {
    return loginUserDto;
  }

  testing() {
    return 'Testing';
  }
}
