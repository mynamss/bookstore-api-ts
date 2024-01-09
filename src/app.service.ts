import { Injectable } from '@nestjs/common';
import { logger } from './utils/custom.logger';

@Injectable()
export class AppService {
  getHello(): string {
    logger.log('contoh log');
    logger.log({
      level: 'warn',
      message: 'CONTOH WARRNNN',
      // refCode: '456789',
    });
    return 'Hello World!';
  }
}
