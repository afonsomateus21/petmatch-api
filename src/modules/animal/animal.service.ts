import { Injectable } from '@nestjs/common';
import { CreateAnimalDto } from './dto/create-animal.dto';
import { UpdateAnimalDto } from './dto/update-animal.dto';
import { PrismaService } from '../../prisma/prisma.service';
import { Prisma } from '@prisma/client';
import { v4 as uuidv4 } from 'uuid';
import { Animal } from './entities/animal.entity';

@Injectable()
export class AnimalService {
  constructor(private prisma: PrismaService) {}

  create(createAnimalDTO: CreateAnimalDto) {
    const codigo_animal = uuidv4();
    
    const sexo = createAnimalDTO.gender.toUpperCase();
    return this.prisma.$executeRaw(
      Prisma.sql`
        INSERT INTO animal (codigo_animal, idade, nome, porte, cor, sexo, descricao, historico_medico, status, codigo_guardiao, codigo_adotante, codigo_ong, codigo_tipo_animal)
        VALUES (${codigo_animal}, ${createAnimalDTO.age}, ${createAnimalDTO.name}, ${createAnimalDTO.size}, ${createAnimalDTO.color}, ${sexo}, ${createAnimalDTO.description}, ${createAnimalDTO.medicalHistory}, ${createAnimalDTO.status}, ${createAnimalDTO.guardian}, ${createAnimalDTO.adopter}, ${createAnimalDTO.ong}, ${createAnimalDTO.typeOfAnimal})
      `
    );
  }

  update(codigo_animal: string, updateAnimalDto: UpdateAnimalDto) {
    if (Object.keys(updateAnimalDto).length === 0) {
      return { message: 'Nenhum dado fornecido para atualização' };
    }
    
    const sets: string[] = [];

    if (updateAnimalDto.name !== undefined) {
      sets.push(`nome = '${updateAnimalDto.name}'`);
    }
  
    if (updateAnimalDto.age !== undefined) {
      sets.push(`idade = '${updateAnimalDto.age}'`);
    }
    
    if (updateAnimalDto.size !== undefined) {
      sets.push(`porte = '${updateAnimalDto.size}'`);
    }
    
    if (updateAnimalDto.color !== undefined) {
      sets.push(`cor = '${updateAnimalDto.color}'`);
    }

    if (updateAnimalDto.gender !== undefined) {
      sets.push(`sexo = '${updateAnimalDto.gender}'`);
    }

    if (updateAnimalDto.description !== undefined) {
      sets.push(`descricao = '${updateAnimalDto.description}'`);
    }

    if (updateAnimalDto.medicalHistory !== undefined) {
      sets.push(`historico_medico = '${updateAnimalDto.medicalHistory}'`);
    }
    
    if (updateAnimalDto.status !== undefined) {
      sets.push(`status = '${updateAnimalDto.status}'`);
    }

    if (updateAnimalDto.guardian !== undefined) {
      sets.push(`codigo_guardiao = '${updateAnimalDto.guardian}'`);
    }

    if (updateAnimalDto.adopter !== undefined) {
      sets.push(`codigo_adotante = '${updateAnimalDto.adopter}'`);
    }

    if (updateAnimalDto.ong !== undefined) {
      sets.push(`codigo_ong = '${updateAnimalDto.ong}'`);
    }

    if (updateAnimalDto.typeOfAnimal !== undefined) {
      sets.push(`codigo_tipo_animal = '${updateAnimalDto.typeOfAnimal}'`);
    }
    
    if (sets.length === 0) {
      return { message: 'Nenhum dado válido fornecido para atualização' };
    }
    
    const setQuery: string = sets.join(', ');
    
    return this.prisma.$executeRawUnsafe(`
      UPDATE animal 
      SET ${setQuery} 
      WHERE codigo_animal = '${codigo_animal}'
    `);
  }
    
  async getAnimal(codigo_animal: string): Promise<Animal | null> {
    const animal: Animal = await this.prisma.$queryRaw(
    Prisma.sql`
      SELECT * FROM animal WHERE codigo_animal = ${codigo_animal}
    `
    ) as Animal;

    return animal[0];
  }

  async listAnimals(): Promise<Animal[] | null> {
    const animals: Animal[] = await this.prisma.$queryRaw(
      Prisma.sql`
        SELECT * FROM animal
      `
    ) as Animal[];;


    return animals;
  }

  removeAnimal(codigo_animal: string) {
    return this.prisma.$executeRaw(
      Prisma.sql`
        DELETE FROM animal WHERE codigo_animal = ${codigo_animal}
      `
    );
  }
}
