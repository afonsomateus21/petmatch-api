-- CreateTable
CREATE TABLE "adocao" (
    "codigo_adocao" INTEGER NOT NULL,
    "codigo_animal" INTEGER,
    "codigo_adotante" INTEGER,
    "codigo_guardiao" INTEGER,
    "codigo_ong" INTEGER,
    "data_adocao" DATE,

    CONSTRAINT "adocao_pkey" PRIMARY KEY ("codigo_adocao")
);

-- CreateTable
CREATE TABLE "adotante" (
    "codigo_usuario" INTEGER NOT NULL,

    CONSTRAINT "adotante_pkey" PRIMARY KEY ("codigo_usuario")
);

-- CreateTable
CREATE TABLE "animal" (
    "codigo_animal" INTEGER NOT NULL,
    "idade" INTEGER,
    "nome" VARCHAR(100),
    "porte" VARCHAR(50),
    "cor" VARCHAR(50),
    "sexo" CHAR(1),
    "descricao" TEXT,
    "historico_medico" TEXT,
    "status" VARCHAR(50),
    "codigo_guardiao" INTEGER,
    "codigo_adotante" INTEGER,
    "codigo_ong" INTEGER,
    "codigo_tipo_animal" INTEGER,

    CONSTRAINT "animal_pkey" PRIMARY KEY ("codigo_animal")
);

-- CreateTable
CREATE TABLE "animal_vacina" (
    "codigo_animal" INTEGER NOT NULL,
    "codigo_vacina" INTEGER NOT NULL,
    "data_aplicacao" DATE NOT NULL,

    CONSTRAINT "animal_vacina_pkey" PRIMARY KEY ("codigo_animal","codigo_vacina")
);

-- CreateTable
CREATE TABLE "avaliacao" (
    "codigo_avaliacao" INTEGER NOT NULL,
    "nota" INTEGER,
    "observacoes" TEXT,
    "codigo_adotante" INTEGER,
    "codigo_guardiao" INTEGER,
    "codigo_ong" INTEGER,

    CONSTRAINT "avaliacao_pkey" PRIMARY KEY ("codigo_avaliacao")
);

-- CreateTable
CREATE TABLE "certificacao" (
    "codigo_certificacao" INTEGER NOT NULL,
    "data_emissao" DATE NOT NULL,
    "emissor" VARCHAR(100) NOT NULL,

    CONSTRAINT "certificacao_pkey" PRIMARY KEY ("codigo_certificacao")
);

-- CreateTable
CREATE TABLE "contato" (
    "codigo_contato" INTEGER NOT NULL,
    "telefone" VARCHAR(20),
    "email" VARCHAR(255),
    "instagram" VARCHAR(100),
    "twitter" VARCHAR(100),
    "facebook" VARCHAR(100),
    "codigo_usuario" INTEGER,
    "codigo_ong" INTEGER,

    CONSTRAINT "contato_pkey" PRIMARY KEY ("codigo_contato")
);

-- CreateTable
CREATE TABLE "endereco" (
    "codigo_endereco" INTEGER NOT NULL,
    "cep" VARCHAR(10),
    "rua" VARCHAR(100),
    "numero" VARCHAR(10),
    "bairro" VARCHAR(50),
    "cidade" VARCHAR(50),
    "estado" CHAR(2),
    "codigo_usuario" INTEGER,
    "codigo_ong" INTEGER,

    CONSTRAINT "endereco_pkey" PRIMARY KEY ("codigo_endereco")
);

-- CreateTable
CREATE TABLE "evento" (
    "codigo_evento" INTEGER NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "descricao" TEXT,
    "data" DATE NOT NULL,
    "codigo_ong" INTEGER,

    CONSTRAINT "evento_pkey" PRIMARY KEY ("codigo_evento")
);

-- CreateTable
CREATE TABLE "favoritos" (
    "codigo_usuario" INTEGER NOT NULL,
    "codigo_animal" INTEGER NOT NULL,
    "data_entrada" DATE,

    CONSTRAINT "favoritos_pkey" PRIMARY KEY ("codigo_usuario","codigo_animal")
);

-- CreateTable
CREATE TABLE "fila_interesse" (
    "codigo_usuario" INTEGER NOT NULL,
    "codigo_animal" INTEGER NOT NULL,
    "data_entrada" DATE,

    CONSTRAINT "fila_interesse_pkey" PRIMARY KEY ("codigo_usuario","codigo_animal")
);

-- CreateTable
CREATE TABLE "guardiao" (
    "codigo_usuario" INTEGER NOT NULL,
    "especialidade" VARCHAR(100),

    CONSTRAINT "guardiao_pkey" PRIMARY KEY ("codigo_usuario")
);

-- CreateTable
CREATE TABLE "ong" (
    "codigo_ong" INTEGER NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "descricao" TEXT,
    "capacidade" INTEGER,

    CONSTRAINT "ong_pkey" PRIMARY KEY ("codigo_ong")
);

-- CreateTable
CREATE TABLE "participa_evento" (
    "codigo_usuario" INTEGER NOT NULL,
    "codigo_evento" INTEGER NOT NULL,
    "data_inscricao" DATE,

    CONSTRAINT "participa_evento_pkey" PRIMARY KEY ("codigo_usuario","codigo_evento")
);

-- CreateTable
CREATE TABLE "possui_certificacao" (
    "codigo_certificacao" INTEGER NOT NULL,
    "codigo_usuario" INTEGER NOT NULL,

    CONSTRAINT "possui_certificacao_pkey" PRIMARY KEY ("codigo_certificacao","codigo_usuario")
);

-- CreateTable
CREATE TABLE "tipo_animal" (
    "codigo" INTEGER NOT NULL,
    "especie" VARCHAR(50) NOT NULL,

    CONSTRAINT "tipo_animal_pkey" PRIMARY KEY ("codigo")
);

-- CreateTable
CREATE TABLE "usuario" (
    "codigo_usuario" INTEGER NOT NULL,
    "senha" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "login" VARCHAR(50) NOT NULL,
    "nome" VARCHAR(100) NOT NULL,

    CONSTRAINT "usuario_pkey" PRIMARY KEY ("codigo_usuario")
);

-- CreateTable
CREATE TABLE "vacina" (
    "codigo_vacina" INTEGER NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "descricao" TEXT,
    "data_validade" DATE NOT NULL,

    CONSTRAINT "vacina_pkey" PRIMARY KEY ("codigo_vacina")
);

-- AddForeignKey
ALTER TABLE "adocao" ADD CONSTRAINT "adocao_codigo_adotante_fkey" FOREIGN KEY ("codigo_adotante") REFERENCES "adotante"("codigo_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "adocao" ADD CONSTRAINT "adocao_codigo_animal_fkey" FOREIGN KEY ("codigo_animal") REFERENCES "animal"("codigo_animal") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "adocao" ADD CONSTRAINT "adocao_codigo_guardiao_fkey" FOREIGN KEY ("codigo_guardiao") REFERENCES "guardiao"("codigo_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "adocao" ADD CONSTRAINT "adocao_codigo_ong_fkey" FOREIGN KEY ("codigo_ong") REFERENCES "ong"("codigo_ong") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "adotante" ADD CONSTRAINT "adotante_codigo_usuario_fkey" FOREIGN KEY ("codigo_usuario") REFERENCES "usuario"("codigo_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "animal" ADD CONSTRAINT "animal_codigo_adotante_fkey" FOREIGN KEY ("codigo_adotante") REFERENCES "usuario"("codigo_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "animal" ADD CONSTRAINT "animal_codigo_guardiao_fkey" FOREIGN KEY ("codigo_guardiao") REFERENCES "usuario"("codigo_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "animal" ADD CONSTRAINT "animal_codigo_ong_fkey" FOREIGN KEY ("codigo_ong") REFERENCES "ong"("codigo_ong") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "animal" ADD CONSTRAINT "animal_codigo_tipo_animal_fkey" FOREIGN KEY ("codigo_tipo_animal") REFERENCES "tipo_animal"("codigo") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "animal_vacina" ADD CONSTRAINT "animal_vacina_codigo_animal_fkey" FOREIGN KEY ("codigo_animal") REFERENCES "animal"("codigo_animal") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "animal_vacina" ADD CONSTRAINT "animal_vacina_codigo_vacina_fkey" FOREIGN KEY ("codigo_vacina") REFERENCES "vacina"("codigo_vacina") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "avaliacao" ADD CONSTRAINT "avaliacao_codigo_adotante_fkey" FOREIGN KEY ("codigo_adotante") REFERENCES "adotante"("codigo_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "avaliacao" ADD CONSTRAINT "avaliacao_codigo_guardiao_fkey" FOREIGN KEY ("codigo_guardiao") REFERENCES "guardiao"("codigo_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "avaliacao" ADD CONSTRAINT "avaliacao_codigo_ong_fkey" FOREIGN KEY ("codigo_ong") REFERENCES "ong"("codigo_ong") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "contato" ADD CONSTRAINT "contato_codigo_ong_fkey" FOREIGN KEY ("codigo_ong") REFERENCES "ong"("codigo_ong") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "contato" ADD CONSTRAINT "contato_codigo_usuario_fkey" FOREIGN KEY ("codigo_usuario") REFERENCES "usuario"("codigo_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "endereco" ADD CONSTRAINT "endereco_codigo_ong_fkey" FOREIGN KEY ("codigo_ong") REFERENCES "ong"("codigo_ong") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "endereco" ADD CONSTRAINT "endereco_codigo_usuario_fkey" FOREIGN KEY ("codigo_usuario") REFERENCES "usuario"("codigo_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "evento" ADD CONSTRAINT "evento_codigo_ong_fkey" FOREIGN KEY ("codigo_ong") REFERENCES "ong"("codigo_ong") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "favoritos" ADD CONSTRAINT "favoritos_codigo_animal_fkey" FOREIGN KEY ("codigo_animal") REFERENCES "animal"("codigo_animal") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "favoritos" ADD CONSTRAINT "favoritos_codigo_usuario_fkey" FOREIGN KEY ("codigo_usuario") REFERENCES "usuario"("codigo_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "fila_interesse" ADD CONSTRAINT "fila_interesse_codigo_animal_fkey" FOREIGN KEY ("codigo_animal") REFERENCES "animal"("codigo_animal") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "fila_interesse" ADD CONSTRAINT "fila_interesse_codigo_usuario_fkey" FOREIGN KEY ("codigo_usuario") REFERENCES "usuario"("codigo_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "guardiao" ADD CONSTRAINT "guardiao_codigo_usuario_fkey" FOREIGN KEY ("codigo_usuario") REFERENCES "usuario"("codigo_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "participa_evento" ADD CONSTRAINT "participa_evento_codigo_evento_fkey" FOREIGN KEY ("codigo_evento") REFERENCES "evento"("codigo_evento") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "participa_evento" ADD CONSTRAINT "participa_evento_codigo_usuario_fkey" FOREIGN KEY ("codigo_usuario") REFERENCES "usuario"("codigo_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "possui_certificacao" ADD CONSTRAINT "possui_certificacao_codigo_certificacao_fkey" FOREIGN KEY ("codigo_certificacao") REFERENCES "certificacao"("codigo_certificacao") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "possui_certificacao" ADD CONSTRAINT "possui_certificacao_codigo_usuario_fkey" FOREIGN KEY ("codigo_usuario") REFERENCES "usuario"("codigo_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

