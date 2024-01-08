import { PrismaClient } from '@prisma/client';
import { logger } from '../utils/custom.logger';

class Database {
  public prisma = new PrismaClient();

  // private logger = new Logger(); //will print this in context

  constructor() {
    this.connection();
  }

  private async connection() {
    try {
      await this.prisma.$connect();
      logger.log('Database Connected.');
    } catch (error) {
      console.error(`Error connectiing to database : ${error}`);
    }
  }
}

export default Database;
