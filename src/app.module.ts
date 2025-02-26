import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AnimalModule } from './animal/animal.module';
import { UserModule } from './modules/user/user.module';

@Module({
  imports: [AnimalModule, UserModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
