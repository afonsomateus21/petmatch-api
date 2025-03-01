import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { CreateUserDto } from './dto/create-user.dto';
import { v4 as uuidv4 } from 'uuid';
import { Prisma } from '@prisma/client';
import { UpdateUserDto } from './dto/update-user.dto';
import { User } from './entities/user';

@Injectable()
export class UserService {
  constructor(private prisma: PrismaService) {}

  create(createUserDto: CreateUserDto) {
    const codigo_usuario = uuidv4();
  
    return this.prisma.$executeRaw(
      Prisma.sql`
        INSERT INTO usuario (codigo_usuario, nome, login, email, senha)
        VALUES (${codigo_usuario}, ${createUserDto.name}, ${createUserDto.login}, ${createUserDto.email}, ${createUserDto.password})
      `
    );
  }

  update(codigo_usuario: string, updateUserDto: UpdateUserDto) {
    if (Object.keys(updateUserDto).length === 0) {
      return { message: 'Nenhum dado fornecido para atualização' };
    }

    const sets: string[] = [];

    if (updateUserDto.name !== undefined) {
      sets.push(`nome = '${updateUserDto.name}'`);
    }

    if (updateUserDto.login !== undefined) {
      sets.push(`login = '${updateUserDto.login}'`);
    }

    if (updateUserDto.email !== undefined) {
      sets.push(`email = '${updateUserDto.email}'`);
    }

    if (updateUserDto.password !== undefined) {
      sets.push(`senha = '${updateUserDto.password}'`);
    }

    if (sets.length === 0) {
      return { message: 'Nenhum dado válido fornecido para atualização' };
    }

    const setQuery: string = sets.join(', ');

    return this.prisma.$executeRawUnsafe(`
      UPDATE usuario 
      SET ${setQuery} 
      WHERE codigo_usuario = '${codigo_usuario}'
    `);
  }

  async getUser(codigo_usuario: string): Promise<User | null> {
    const user: User = await this.prisma.$queryRaw(
      Prisma.sql`
        SELECT * FROM usuario WHERE codigo_usuario = ${codigo_usuario}
      `
    ) as User;

    return user[0];
  }

  async listUsers(): Promise<User[] | null> {
    const users: User[] = await this.prisma.$queryRaw(
      Prisma.sql`
        SELECT * FROM usuario
      `
    ) as User[];;


    return users;
  }

  removeUser(codigo_usuario: string) {
    return this.prisma.$executeRaw(
      Prisma.sql`
        DELETE FROM usuario WHERE codigo_usuario = ${codigo_usuario}
      `
    );
  }
}
