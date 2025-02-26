import { Injectable } from '@nestjs/common';
import { CreateAnimalDto } from './dto/create-animal.dto';
import { UpdateAnimalDto } from './dto/update-animal.dto';
import { PrismaService } from '../../prisma/prisma.service';
import { Prisma } from '@prisma/client';

@Injectable()
export class AnimalService {
  constructor(private prisma: PrismaService) {}

  create(createAnimalDto: CreateAnimalDto) {
    return this.prisma.$queryRaw(Prisma.sql`
      INSERT INTO animal (nome, idade, porte, sexo, cor, descricao, codigo_tipo_animal, codigo_guardiao)
      VALUES (?, ?, ?, ?, ?, ?, ?)
    `, createAnimalDto.nome, 
      createAnimalDto.idade, 
      createAnimalDto.porte, 
      createAnimalDto.sexo, 
      createAnimalDto.cor, 
      createAnimalDto.descricao, 
      createAnimalDto.codigo_tipo_animal,
      createAnimalDto.codigo_guardiao,

    );
  }

  findAll() {
    return `This action returns all animal`;
  }

  findOne(id: number) {
    return `This action returns a #${id} animal`;
  }

  update(id: number, updateAnimalDto: UpdateAnimalDto) {
    return `This action updates a #${id} animal`;
  }

  remove(id: number) {
    return `This action removes a #${id} animal`;
  }
}
