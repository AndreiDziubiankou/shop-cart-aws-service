import { DataSourceOptions } from 'typeorm';
import { Cart, CartItem } from '../cart/entities';

export const getDatabaseConfig = async (): Promise<DataSourceOptions> => {
  return {
    type: 'postgres',
    host: process.env.DB_HOST,
    port: +process.env.DB_PORT,
    username: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    entities: [Cart, CartItem],
    logging: true,
  };
};
