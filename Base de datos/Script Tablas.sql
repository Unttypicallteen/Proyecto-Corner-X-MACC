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

Triggers 

CREATE OR REPLACE FUNCTION asignar_lugar_parqueo()
RETURNS TRIGGER AS $$
DECLARE
    lugar_disponible CHAR(3);
BEGIN
    -- Seleccionar un lugar de parqueo disponible
    SELECT lugar_parqueo INTO lugar_disponible
    FROM Lugar_Parking
    WHERE Disponible = true
    ORDER BY RANDOM()
    LIMIT 1
    FOR UPDATE;
    
    -- Verificar si hay un lugar disponible
    IF NOT FOUND THEN
        RAISE EXCEPTION 'No hay lugares de parqueo disponibles';
    END IF;

    -- Asignar el lugar de parqueo encontrado al nuevo registro
    NEW.lugar_parqueo := lugar_disponible;

    -- Marcar el lugar de parqueo como ocupado y asignar placa y tipo de vehículo
    UPDATE Lugar_Parking
    SET Disponible = false,
        placa = NEW.Placa_Vehiculo,
        Tipo_Vehiculo = NEW.Tipo_Vehiculo
    WHERE lugar_parqueo = lugar_disponible;

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
    -- Marcar el lugar de parqueo como disponible y limpiar Placa y Tipo_Vehiculo
    UPDATE Lugar_Parking
    SET Disponible = true, Placa = NULL, Tipo_Vehiculo = NULL
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
