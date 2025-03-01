import { Module } from '@nestjs/common';
import { AnimalService } from './animal.service';
import { AnimalController } from './animal.controller';
import { PrismaService } from 'src/prisma/prisma.service';

@Module({
  controllers: [AnimalController],
  providers: [AnimalService, PrismaService],
})
export class AnimalModule {}
