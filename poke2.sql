
SELECT * FROM POKEMON

SELECT * FROM ENTRENADOR

-- Muestra información detallada sobre Pokémon y sus entrenadores en una única consulta
select
	Pokemon.Id,
	Pokemon.NOMBRE as Pokemon,
	Pokemon.Tipo as Tipo,
	Pokemon.Habilidad as Habilidad,
	Pokemon.Ataque as Ataque,
	Pokemon.Defensa as Defensa,
	Pokemon.Velocidad as Velocidad,
	Entrenador.Id,
	Entrenador.NOMBRE as Entrenador,
	Entrenador.Apellido as Apellido
	
from Intermedia
join Pokemon on Intermedia.pokemon_id = Pokemon.Id
join Entrenador on Intermedia.entrenador_id = Entrenador.Id;

-- SELECT t1.id1, t1.nombre1, t2.id2, t2.nombre2
-- FROM tabla_intermediaria ti
-- JOIN tabla1 t1 ON ti.id1 = t1.id1
-- JOIN tabla2 t2 ON ti.id2 = t2.id2;

-- Eliminar registros relacionados en la tabla Intermedia
delete from Intermedia
using Pokemon
where Intermedia.pokemon_id = Pokemon.Id
and Pokemon.Id = 6;

-- Eliminar registros relacionados en la tabla Batalla
delete from Batalla
using Pokemon
where( Batalla.pokemon1_id = Pokemon.Id
	or Batalla.pokemon2_id = Pokemon.Id
	or Batalla.EntrenadorGanador_id = Pokemon.Id)
and Pokemon.Id = 6;

--Eliminar el Pokemon deseado
DELETE FROM Pokemon
WHERE Id = 6;


-- delete from Intermedia
-- join Pokemon on Intermedia.pokemon_id = Pokemon.Id
-- join Entrenador on Intermedia.entrenador_id = Entrenador.Id
-- where Pokemon.Id = 2;


--Actualizar la información de un Pokémon o un entrenador
update Pokemon set Nombre='Squirtle'
where nombre='Mewtwo';


--Mostrar información sobre las batallas, incluyendo nombres de los entrenadores y Pokemones.
SELECT
   b.batalla_id,
   b.Fecha,
   p1.Id AS Pokemon1_Id,
   p1.Nombre AS Pokemon1,
   e1.Id AS Entrenador1_Id,
   e1.Nombre AS Entrenador1,
   p2.Id AS Pokemon2_Id,
   p2.Nombre AS Pokemon2,
   e2.Id AS Entrenador2_Id,
   e2.Nombre AS Entrenador2,
   b.EntrenadorGanador_id AS EntrenadorGanador_id,
   e.Nombre AS EntrenadorGanador
FROM Batalla b
JOIN Pokemon p1 ON b.pokemon1_id = p1.Id
JOIN Entrenador e1 ON b.entrenador1_id = e1.Id
JOIN Pokemon p2 ON b.pokemon2_id = p2.Id
JOIN Entrenador e2 ON b.entrenador2_id = e2.Id
JOIN Entrenador e on b.EntrenadorGanador_id = e.id;
