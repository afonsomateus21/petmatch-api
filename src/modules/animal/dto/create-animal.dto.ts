import { IsNotEmpty, IsNumber, IsString } from "class-validator";

export class CreateAnimalDto {
	@IsString()
	@IsNotEmpty({ message: "Name is required" })
	name: string;

	@IsNumber()
	@IsNotEmpty({ message: "Age is required" })
	age: number;

	@IsString()
	@IsNotEmpty({ message: "Size is required" })
	size: string;

	@IsString()
	@IsNotEmpty({ message: "Color is required" })
	color: string;

	@IsString()
	@IsNotEmpty({ message: "Gender is required" })
	gender: string;

	@IsString()
	@IsNotEmpty({ message: "Description is required" })
	description: string;

	@IsString()
	@IsNotEmpty({ message: "MedicalHistory is required" })
	medicalHistory: string;

	@IsString()
	@IsNotEmpty({ message: "Status is required" })
	status: string;

	@IsString()
	guardian: string;

	@IsString()
	ong: string;

	@IsString()
	adopter: string;

	@IsString()
	typeOfAnimal: string;
}
