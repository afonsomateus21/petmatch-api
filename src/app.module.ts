import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AnimalModule } from './animal/animal.module';
import { AdopterModule } from './adopter/adopter.module';

@Module({
  imports: [AnimalModule, AdopterModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
