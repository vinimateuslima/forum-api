import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { User as UserModel } from 'generated/prisma/client';
import { UserService } from './user.service';
import { Prisma } from 'generated/prisma/browser';



@Controller('user')
export class UserController {

    constructor(private userService: UserService) { }

    @Post()
    async signupUser(
        @Body() userData: Prisma.UserCreateInput,
    ): Promise<UserModel> {
        return this.userService.createUser(userData);
    }

    @Get()
    async getAllUsers(): Promise<UserModel[]> {
        return this.userService.users({});
    }

    @Get(':id')
    async getUserById(@Param('id') id: string): Promise<UserModel | null> {
        return this.userService.user({ id: Number(id) });
    }

    @Put(':id')
    async updateUser(
        @Body() userData: Prisma.UserUpdateInput,
        @Param('id') id: string,


    ): Promise<UserModel> {
        return this.userService.updateUser({
            where: { id: Number(id) },
            data: userData,
        });
    }

    @Delete(':id')
    async deleteUser(@Param('id') id: string): Promise<UserModel> {
        return this.userService.deleteUser({ id: Number(id) });
    }

}
