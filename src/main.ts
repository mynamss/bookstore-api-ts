import { NestFactory } from '@nestjs/core';
import { config } from 'dotenv';
config();
// modules
import { AppModule } from './app.module';
// logger
import { CustomLogger } from './utils/custom.logger';
import { WinstonModule } from 'nest-winston';
// database
import Database from './config/dbConnection';

const { PORT } = process.env;
const prismaConnection = new Database().prisma;

async function bootstrap() {
  const customLogger = new CustomLogger();

  const app = await NestFactory.create(AppModule, {
    logger: WinstonModule.createLogger(customLogger.createLoggerConfig),
  });

  // Prisma connection check
  prismaConnection;

  await app.listen(PORT || 3000);
}
bootstrap();
