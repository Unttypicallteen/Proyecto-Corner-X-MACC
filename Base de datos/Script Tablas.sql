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

create table Lugar_Parking (
    lugar_parqueo char(3),
	Disponible boolean not null,
	Placa char(6),
	Tipo_Vehiculo Varchar(10),
	lugar_p_izq char(3),
	lugar_p_der char(3),
    primary key (lugar_parqueo),
	foreign key (Placa) references vehiculo(Placa),
	check (lower(Tipo_Vehiculo) in ('moto', 'carro', 'camioneta'))
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


create table historial_Registro(
    ID serial,
	nombre varchar(30),
	Placa_Vehiculo char(6),
	Tipo_vehiculo Varchar(10),
	lugar_parqueo char(3),
	hora_ingreso time not null,
	fecha_ingreso date not null,
	hora_salida time not null,
	fecha_salida date not null,
	primary key (id),
);


CREATE OR REPLACE FUNCTION asignar_lugar_parqueo()
RETURNS TRIGGER AS $$
DECLARE
    lugar_izq CHAR(3);
    lugar_der CHAR(3);
    camionetas_consecutivas INT := 0;
BEGIN
    -- Obtener los lugares a la izquierda y derecha del lugar que se está asignando
    lugar_izq := NEW.lugar_p_izq;
    lugar_der := NEW.lugar_p_der;

    -- Contar camionetas consecutivas a la izquierda
    IF lugar_izq IS NOT NULL THEN
        SELECT COUNT(*)
        INTO camionetas_consecutivas
        FROM Lugar_Parking
        WHERE lugar_parqueo = lugar_izq
        AND Tipo_Vehiculo = 'camioneta';
    END IF;

    -- Contar camionetas consecutivas a la derecha
    IF lugar_der IS NOT NULL THEN
        SELECT camionetas_consecutivas + COUNT(*)
        INTO camionetas_consecutivas
        FROM Lugar_Parking
        WHERE lugar_parqueo = lugar_der
        AND Tipo_Vehiculo = 'camioneta';
    END IF;

    -- Si ya hay dos camionetas consecutivas, impedir la asignación de una tercera
    IF camionetas_consecutivas >= 2 AND NEW.Tipo_Vehiculo = 'camioneta' THEN
        RAISE EXCEPTION 'No se pueden estacionar más de 2 camionetas consecutivas.';
    END IF;

    -- Si todo está bien, continuar con la inserción
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
    INSERT INTO historial_registro (nombre,Placa_Vehiculo, Tipo_Vehiculo, lugar_parqueo, hora_ingreso, fecha_ingreso, hora_salida, fecha_salida)
    VALUES (old.nombre,OLD.Placa_Vehiculo, OLD.Tipo_Vehiculo, OLD.lugar_parqueo, OLD.hora_ingreso, OLD.fecha_ingreso, current_time, current_date);

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
