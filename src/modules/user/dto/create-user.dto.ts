import { IsEmail, IsNotEmpty, IsString } from 'class-validator';

export class CreateUserDto {
	@IsString()
	@IsNotEmpty({ message: "Name is required" })
	name: string;

	@IsString()
	@IsNotEmpty({ message: "Login is required" })
	login: string;

	@IsEmail({}, { message: 'Email inválido' })
	@IsNotEmpty({ message: "Email is required" })
	email: string;

	@IsNotEmpty({ message: "Password is required" })
	password: string;
}