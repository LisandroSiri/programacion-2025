DROP TABLE IF EXISTS "reacciones" CASCADE;
DROP TABLE IF EXISTS "publicaciones" CASCADE;
DROP TABLE IF EXISTS "usuarios" CASCADE;


CREATE TABLE "usuarios" (
	"id" SERIAL NOT NULL UNIQUE,
	"nombre_usuario" VARCHAR(50) NOT NULL,
	"fecha_registro" DATE NOT NULL,
	PRIMARY KEY("id")
);




CREATE TABLE "publicaciones" (
	"id" SERIAL NOT NULL UNIQUE,
	"contenido" TEXT NOT NULL,
	"fecha_publicacion" TIMESTAMP NOT NULL,
	"autor_de_post" SERIAL NOT NULL,
	PRIMARY KEY("id")
);




CREATE TABLE "reacciones" (
	"id" SERIAL NOT NULL UNIQUE,
	"tipo" VARCHAR(20) NOT NULL,
	"fecha_reaccion" TIMESTAMP NOT NULL,
	"id_publicacion" SERIAL NOT NULL,
	"id_usuario" SERIAL NOT NULL,
	PRIMARY KEY("id")
);




CREATE TABLE "reacciones/publicacion" (
	"id_reaccion" SERIAL NOT NULL UNIQUE,
	"id_publicacion" SERIAL NOT NULL
);



ALTER TABLE "reacciones/publicacion"
ADD FOREIGN KEY("id_reaccion") REFERENCES "reacciones"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "reacciones/publicacion"
ADD FOREIGN KEY("id_publicacion") REFERENCES "publicaciones"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "reacciones"
ADD FOREIGN KEY("id_publicacion") REFERENCES "publicaciones"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "reacciones"
ADD FOREIGN KEY("id_usuario") REFERENCES "usuarios"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;



INSERT INTO "usuarios" ("nombre_usuario", "fecha_registro") VALUES
('Lisandro', '2025-01-05'),
('Delfina', '2025-02-10'),
('Mateo', '2025-02-20');


INSERT INTO "publicaciones" ("contenido", "fecha_publicacion", "autor_de_post") VALUES
('¡Hola a todos en la red social!', '2025-03-01 10:00:00', 1),
('Qué lindo día para programar SQL 😊', '2025-03-02 14:30:00', 2),
('Estoy aprendiendo PostgreSQL 🚀', '2025-03-03 09:15:00', 3);


INSERT INTO "reacciones" ("tipo", "fecha_reaccion", "id_publicacion", "id_usuario") VALUES
('Like', '2025-03-01 11:00:00', 1, 2),
('Me encanta', '2025-03-02 15:00:00', 2, 1),
('Like', '2025-03-03 10:00:00', 3, 2),
('Triste', '2025-03-03 10:05:00', 3, 1);



SELECT * FROM "usuarios";