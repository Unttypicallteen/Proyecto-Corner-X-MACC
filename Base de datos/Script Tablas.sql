create table Vehiculo (
    Placa char(6),
    Tipo_Vehiculo Varchar(10),
    primary key(Placa),
    check (lower(Tipo_Vehiculo) in ('moto', 'carro', 'camioneta'))
);
create table Conductor (
    ID INT,
    Placa_Vehiculo char(6),
    primary key(ID),
    foreign key (Placa_Vehiculo) references vehiculo(Placa)
);

create table vigilante(
    id int,
    nombre varchar(50),
    primary key(id)
);

create table Lugar_Parking (
    lugar_parqueo char(3),
    primary key (lugar_parqueo)
);

create table Parking(
    ticket SERIAL,
    ID_vigilante int,
    ID_conductor int,
	lugar_parqueo char(3),
    primary key (ticket),
    foreign key (ID_conductor) references conductor(ID),
    foreign key (ID_vigilante) references vigilante(id),
	foreign key (lugar_parqueo) references Lugar_Parking(lugar_parqueo)
);

create table registro(
    ID serial,
    ticket serial,
    lugar_parqueo char(3),
    hora_ingreso time,
    fecha_ingreso date,
    hora_salida time,
    fecha_salida date,
    primary key (ID),
    foreign key (ticket) references parking(ticket),
    foreign key (lugar_parqueo) references Lugar_parking(lugar_parqueo)
);

