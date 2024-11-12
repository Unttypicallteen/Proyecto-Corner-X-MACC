create table Vehiculo (
    Placa char(6),
    Tipo_Vehiculo Varchar(10),
    primary key(Placa),
    check (lower(Tipo_Vehiculo) in ('moto', 'carro', 'camioneta'))
);
create table Conductor(
    ID INT,
	nombre varchar(30) unique,
    Placa_Vehiculo char(6) not null,
    primary key(ID),
    foreign key (Placa_Vehiculo) references vehiculo(Placa)
);
create table vigilante(
    id int,
    nombre varchar(50) not null,
    primary key(id)
);

CREATE TABLE Lugar_Parking (
    lugar_parqueo CHAR(3) PRIMARY KEY,
    Disponible BOOLEAN NOT NULL,
    Placa CHAR(6),
    Tipo_Vehiculo VARCHAR(10),
	 FOREIGN KEY (Placa) REFERENCES vehiculo(Placa),
	 CHECK (Tipo_Vehiculo IN ('Moto', 'Carro', 'Camioneta'))
);


create table registro(
    ID serial,
	nombre varchar(30)UNIQUE,
	Placa_Vehiculo char(6)UNIQUE,
	Tipo_vehiculo Varchar(10),
	lugar_parqueo char(3),
	hora_ingreso time not null,
	fecha_ingreso date not null,
	primary key (id),
	foreign key (Placa_Vehiculo) references vehiculo(Placa),
	foreign key (nombre) references conductor(nombre),
	foreign key (lugar_parqueo) references Lugar_Parking(lugar_parqueo),
	check (lower(Tipo_Vehiculo) in ('moto', 'carro', 'camioneta'))
);

Create table rol (
nombre varchar(30) unique,
	contraseña varchar(6),
	rol varchar(10),
	primary key (nombre)
	CHECK (rol IN ('Usuario', 'Vigilante')
);

create table historial_Registro(
    ID serial,
	nombre varchar(30),
	Placa_Vehiculo char(6),
	Tipo_vehiculo Varchar(10),
	lugar_parqueo char(3),
	hora_ingreso time not null,
	fecha_ingreso date not null,
	hora_salida time ,
	fecha_salida date ,
	primary key (id)
);

CREATE OR REPLACE FUNCTION asignar_lugar_parqueo()
RETURNS TRIGGER AS $$
DECLARE
    lugar_disponible CHAR(3);
    piso CHAR(1);
    pisos TEXT[] := ARRAY['A', 'B', 'C', 'D', 'E'];  -- Array con los pisos
BEGIN
    -- Bucle para seguir buscando lugar hasta encontrar uno que cumpla las condiciones
    FOREACH piso IN ARRAY pisos LOOP
        -- Si es camioneta, buscamos lugares impares en el piso actual
        IF NEW.Tipo_Vehiculo = 'Camioneta' THEN
            -- Buscar un lugar impar disponible en el piso actual
            SELECT lugar_parqueo INTO lugar_disponible
            FROM Lugar_Parking
            WHERE Disponible = true
              AND lugar_parqueo LIKE piso || '%'  -- Buscar lugares en el piso actual
              AND (CAST(SUBSTRING(lugar_parqueo FROM 2) AS INTEGER) % 2 = 1)  -- Solo lugares impares
            ORDER BY RANDOM()
            LIMIT 1
            FOR UPDATE;

            -- Si encontramos un lugar disponible, salimos del bucle
            IF lugar_disponible IS NOT NULL THEN
                EXIT;
            END IF;

        ELSE
            -- Si no es camioneta, buscamos cualquier lugar disponible en el piso actual
            SELECT lugar_parqueo INTO lugar_disponible
            FROM Lugar_Parking
            WHERE Disponible = true
              AND lugar_parqueo LIKE piso || '%'  -- Buscar lugares en el piso actual
            ORDER BY RANDOM()
            LIMIT 1
            FOR UPDATE;
            
            -- Si encontramos un lugar disponible, salimos del bucle
            IF lugar_disponible IS NOT NULL THEN
                EXIT;
            END IF;
        END IF;
    END LOOP;

    -- Si no se encuentra un lugar disponible, lanzar una excepción
    IF lugar_disponible IS NULL THEN
        RAISE EXCEPTION 'No hay lugares disponibles en este momento.';
    END IF;

    -- Asignar el lugar disponible al nuevo registro
    NEW.lugar_parqueo := lugar_disponible;

    -- Marcar el lugar de parqueo como ocupado y asignar placa y tipo de vehículo
    UPDATE Lugar_Parking
    SET Disponible = false,
        Placa = NEW.Placa_Vehiculo,  -- Cambia "Placa" por el nombre correcto en la tabla Lugar_Parking
        Tipo_Vehiculo = NEW.Tipo_Vehiculo  -- Asegúrate de que "Tipo_Vehiculo" existe en la tabla Lugar_Parking
    WHERE lugar_parqueo = NEW.lugar_parqueo;
    
    -- Insertar en historial de registro
    INSERT INTO historial_registro (nombre, Placa_Vehiculo, Tipo_Vehiculo, lugar_parqueo, hora_ingreso, fecha_ingreso)
    VALUES (NEW.nombre, NEW.Placa_Vehiculo, NEW.Tipo_Vehiculo, NEW.lugar_parqueo, current_time, current_date);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER before_insert_registro
BEFORE INSERT ON registro
FOR EACH ROW
EXECUTE FUNCTION asignar_lugar_parqueo();

CREATE OR REPLACE FUNCTION limpiar_lugar_parqueo()
RETURNS TRIGGER AS $$
BEGIN
    -- Actualizar la tabla Lugar_Parking para marcar el lugar como disponible y limpiar los datos del vehículo
    UPDATE Lugar_Parking
    SET Disponible = true, Placa = NULL, Tipo_Vehiculo = NULL
    WHERE lugar_parqueo = OLD.lugar_parqueo;

    -- Eliminar el vehículo de la tabla Vehiculos_En_Parqueadero
    DELETE FROM registro
    WHERE placa_vehiculo = OLD.Placa_Vehiculo;

    -- Insertar un registro en la tabla Historial_Parqueadero con la hora de salida
		UPDATE historial_registro
			SET hora_salida = current_time,
			fecha_salida = current_date
		WHERE lugar_parqueo = OLD.lugar_parqueo;

	RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER limpiar_lugar
AFTER DELETE ON registro
FOR EACH ROW
EXECUTE FUNCTION limpiar_lugar_parqueo();

#Contador  
	
CREATE VIEW Contador AS select disponible from lugar_parking

select disponible,count(*) from contador where disponible = 'True'  group by disponible 
