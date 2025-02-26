import { TipoAnimalEnum } from '../enums/TipoAnimalEnum';

export class CreateAnimalDto {
  nome: String;
  idade: Number;
  porte: String;
  sexo: String;
  cor: String;
  descricao: String;
  codigo_tipo_animal: TipoAnimalEnum;
  codigo_guardiao: Number;
}
