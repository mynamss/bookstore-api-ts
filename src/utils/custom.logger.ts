import { Logger } from '@nestjs/common';
import * as winston from 'winston';
import DailyRotateFile from 'winston-daily-rotate-file';

export class CustomLogger {
  private dailyRotateFileTransport: DailyRotateFile;
  private customFormat: winston.Logform.Format;
  public createLoggerConfig: winston.LoggerOptions;

  constructor() {
    this.loggerDefine();
  }

  private loggerDefine() {
    /** A transport for winston which logs to a rotating file based on date**/
    this.dailyRotateFileTransport = new DailyRotateFile({
      filename: `logs/app_log-%DATE%.log`,
      zippedArchive: false,
      maxSize: '20m',
      maxFiles: '1d',
    });

    /**
     * Custom log format tailored to our application's requirements
     */
    this.customFormat = winston.format.printf(
      ({ level = 'info', message, timestamp, req, err, ...metadata }) => {
        if (!req) {
          req = { headers: {} };
        }

        let msg = `${timestamp} [${level}] : ${message} `;
        const jsonData = {
          timestamp,
          level,
          ...metadata,
          message,
          error: {},
        };

        if (err) {
          jsonData.error = err.stack || err;
        }

        msg = JSON.stringify(jsonData);
        return msg;
      },
    );

    this.createLoggerConfig = {
      level: 'warn', // this will print warn and above level (error also)
      format: winston.format.combine(
        winston.format.colorize(),
        winston.format.splat(),
        winston.format.errors({ stack: true }),
        winston.format.json(),
        winston.format.timestamp({
          format: 'YYYY-MM-DD HH:mm:ss',
        }),
        this.customFormat,
      ),

      transports: [
        new winston.transports.Console({
          format: winston.format.combine(
            winston.format.colorize(),
            winston.format.simple(),
            winston.format.printf(({ level, message, timestamp }) => {
              return `[${timestamp}] [${level}]: ${message}`;
            }),
          ),
          level: 'info' || 'warn',
        }),
        this.dailyRotateFileTransport,
      ],
    };
  }
}

export const logger = new Logger();
