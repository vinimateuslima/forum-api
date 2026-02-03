import { Module } from '@nestjs/common';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import { UserModule } from 'src/user/user.module';
import { JwtModule } from '@nestjs/jwt';
import * as fs from 'fs';
import { ConfigModule, ConfigService } from '@nestjs/config';

@Module({
    imports: [
        UserModule,
        JwtModule.registerAsync({
            imports: [ConfigModule],
            inject: [ConfigService],
            useFactory: (configService: ConfigService) => ({
                secret: configService.get<string>('SECRET_KEY'),
                signOptions: { expiresIn: '60m' },
            }),
        }),

    ],
    controllers: [AuthController],
    providers: [AuthService]

})
export class AuthModule { }
