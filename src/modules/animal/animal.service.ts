import { Injectable } from '@nestjs/common';
import { CreateAnimalDto } from './dto/create-animal.dto';
import { UpdateAnimalDto } from './dto/update-animal.dto';
import { PrismaService } from '../../prisma/prisma.service';

@Injectable()
export class AnimalService {
  constructor(private prisma: PrismaService) {}

  create(createAnimalDto: CreateAnimalDto) {
    return this.prisma.$queryRaw(`
      INSERT INTO animal (name, type)
      VALUES ('${createAnimalDto.name}', '${createAnimalDto.type}')
    `);
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
