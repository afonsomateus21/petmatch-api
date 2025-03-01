import { Controller, Get, Post, Body, Param, Delete, Put } from '@nestjs/common';
import { AnimalService } from './animal.service';
import { CreateAnimalDto } from './dto/create-animal.dto';
import { UpdateAnimalDto } from './dto/update-animal.dto';
import { ApiTags } from '@nestjs/swagger';

@ApiTags('animal')
@Controller('animal')
export class AnimalController {
  constructor(private readonly animalService: AnimalService) {}

  @Post()
  create(@Body() createAnimalDto: CreateAnimalDto) {
    return this.animalService.create(createAnimalDto);
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.animalService.getAnimal(id);
  }

  @Get('')
  findAll() {
    return this.animalService.listAnimals();
  }

  @Put(':id')
  update(@Param('id') id: string, @Body() updateAnimalDto: UpdateAnimalDto) {
    return this.animalService.update(id, updateAnimalDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.animalService.removeAnimal(id);
  }
}
