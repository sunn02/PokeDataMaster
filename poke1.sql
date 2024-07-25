
-- Tabla de pokemon
CREATE TABLE Pokemon (
   Id INT PRIMARY KEY,
   Nombre VARCHAR(200) NOT null,
   Tipo VARCHAR(200) NOT null,
   Habilidad VARCHAR(200) NOT null,
   Ataque INT not null,
   Defensa INT not null,
   Velocidad INT not null
);

-- Tabla de entrenador
CREATE TABLE Entrenador (
   Id INT PRIMARY KEY,
   Nombre VARCHAR(20) NOT null,
   Apellido VARCHAR(20)
);

-- Tabla intermedia, relacion entre pokemones y entrenadores
CREATE TABLE Intermedia (
   intermediario_id SERIAL PRIMARY KEY, --Se agrega el SERIAL para que su id se genere automáticamente
   pokemon_id INT NOT NULL,
   entrenador_id INT NOT NULL,
  
   --Claves Foráneas: referencias a las claves primarias de las dos tablas que están siendo relacionadas.
   FOREIGN KEY (pokemon_id) REFERENCES pokemon(Id),
   FOREIGN KEY (entrenador_id) REFERENCES entrenador(Id),
   --Restricción única para evitar duplicados de combinaciones de las claves foráneas. 
   --Es decir, no se puede insertar dos veces un mismo pokemon a un entrenador o asignar un mismo pokemon a otro entrenador
   UNIQUE (pokemon_id)
);


-- Tabla de Batalla
CREATE TABLE Batalla (
   batalla_id SERIAL PRIMARY KEY,
   Fecha DATE not null ,
   pokemon1_id INT NOT NULL,
   entrenador1_id INT NOT NULL,
   pokemon2_id INT NOT NULL,
   entrenador2_id INT NOT NULL,
   EntrenadorGanador_id INT,
   FOREIGN KEY (pokemon1_id) REFERENCES pokemon(Id),
   FOREIGN KEY (entrenador1_id) REFERENCES entrenador(Id),
  
   FOREIGN KEY (pokemon2_id) REFERENCES pokemon(Id),
   FOREIGN KEY (entrenador2_id) REFERENCES entrenador(Id),

   FOREIGN KEY (EntrenadorGanador_id) REFERENCES entrenador(Id)
);




-- Insertar Pokemon
INSERT INTO Pokemon (Id, Nombre, Tipo, Habilidad, Ataque, Defensa, Velocidad)
VALUES (1, 'Pikachu', 'Eléctrico', 'Electricidad Estática', 55, 40, 90);
INSERT INTO Pokemon (Id, Nombre, Tipo, Habilidad, Ataque, Defensa, Velocidad)
VALUES (2, 'Charizard', 'Fuego', 'Llamas', 52, 43, 65);
INSERT INTO Pokemon (Id, Nombre, Tipo, Habilidad, Ataque, Defensa, Velocidad)
VALUES (3, 'Bulbasaur', 'Planta', 'Clorofila', 49, 49, 45);
INSERT INTO Pokemon (Id, Nombre, Tipo, Habilidad, Ataque, Defensa, Velocidad)
VALUES (4, 'Squirtle', 'Agua', 'Torrente', 48, 65, 43);
INSERT INTO Pokemon (Id, Nombre, Tipo, Habilidad, Ataque, Defensa, Velocidad)
VALUES (5, 'Jigglypuff', 'Normal', 'Cuerpo Dócil', 45, 20, 20);

--Prueba
INSERT INTO Pokemon (Id, Nombre, Tipo, Habilidad, Ataque, Defensa, Velocidad)
VALUES (6, 'Gengar', 'Fantasma/Veneno', 'Levitate', 65, 60, 110);


--- Insertar Entrenador
insert into Entrenador (Id, Nombre, Apellido)
values (1, 'Ash', 'Ketchum');
insert into Entrenador (Id, Nombre)
values (2, 'Misty');
INSERT INTO Entrenador (Id, Nombre, Apellido)
VALUES (3, 'Brock', 'Harrison');
INSERT INTO Entrenador (Id, Nombre)
VALUES (4, 'Jessie');
INSERT INTO Entrenador (Id, Nombre, Apellido)
VALUES (5, 'Gary', 'Oak');

--Prueba 
INSERT INTO Entrenador (Id, Nombre)
VALUES (6, 'Fulana');


--- Insertar una relacion
insert into Intermedia(pokemon_id,entrenador_id)
values (1,1);
insert into Intermedia(pokemon_id,entrenador_id)
values (2,1);
INSERT INTO Intermedia (pokemon_id, entrenador_id)
VALUES (3, 2);
INSERT INTO Intermedia (pokemon_id, entrenador_id)
VALUES (4, 4);
INSERT INTO Intermedia (pokemon_id, entrenador_id)
VALUES (5, 5);

--Prueba para duplicado
INSERT INTO Intermedia (pokemon_id, entrenador_id)
VALUES (1, 1);
--Prueba para un pokemon con otro entrenador
INSERT INTO Intermedia (pokemon_id, entrenador_id)
VALUES (5, 6);
--Prueba para eliminar relacion 
INSERT INTO Intermedia (pokemon_id, entrenador_id)
VALUES (6, 6);

--- Insertar batalla
insert into Batalla (Fecha,pokemon1_id,entrenador1_id, pokemon2_id, entrenador2_id, EntrenadorGanador_id)
values ('2023-07-23',1,1,3,2,1);
INSERT INTO Batalla (Fecha, pokemon1_id, entrenador1_id, pokemon2_id, entrenador2_id, EntrenadorGanador_id)
VALUES ('2023-07-25', 4, 4, 1, 1,4);
INSERT INTO Batalla (Fecha, pokemon1_id, entrenador1_id, pokemon2_id, entrenador2_id, EntrenadorGanador_id)
VALUES ('2023-07-26', 5, 5, 3, 3, 5);
INSERT INTO Batalla (Fecha, pokemon1_id, entrenador1_id, pokemon2_id, entrenador2_id, EntrenadorGanador_id)
VALUES ('2023-07-27', 2, 1, 3, 3, 1);
INSERT INTO Batalla (Fecha, pokemon1_id, entrenador1_id, pokemon2_id, entrenador2_id, EntrenadorGanador_id)
VALUES ('2023-07-28', 1, 1, 4, 4, 4);

--Prueba para eliminar
INSERT INTO Batalla (Fecha, pokemon1_id, entrenador1_id, pokemon2_id, entrenador2_id, EntrenadorGanador_id)
VALUES ('2023-07-29', 4, 4, 6, 6, 6);
