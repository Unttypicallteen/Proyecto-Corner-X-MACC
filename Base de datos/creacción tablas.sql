create table Vehiculo (
Placa char(6),
Tipo_Vehiculo Varchar(10),
primary key(Placa)
);

create table Conductor (
ID INT,
Placa_Vehiculo char(6),
primary key(ID),
foreign key (Placa_Vehiculo) references vehiculo(Placa))
;

create table vigilante(
id int,
nombre varchar(50),
primary key(id)
);

create table Parking(
ticket SERIAL,
disponible bool,
lugar_parqueo char(3),
ID_vigilante int,
ID_conductor int,
primary key (ticket),
foreign key (ID_conductor) references conductor(ID),
foreign key (ID_vigilante) references vigilante(id)
);

create table registro(
ID serial,
ticket serial,
hora_ingreso time,
fecha_ingreso date,
hora_salida time,
fecha_salida date,
primary key (ID),
foreign key (ticket) references parking(ticket)
);
