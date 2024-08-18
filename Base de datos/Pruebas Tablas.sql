select * from vehiculo

insert into vehiculo values ('JSY980','Camioneta');
insert into vehiculo values ('IEN90E','MOTO');

select * from conductor

insert into conductor values ('1011087293','JSY980');
insert into conductor values ('1011087292','IEN90E');

select * from vigilante

insert into vigilante values ('1234','Pepito Perez')
insert into vigilante values ('1235','Pepita Perez')

select * from lugar_parking

insert into lugar_parking values ('A01');
insert into lugar_parking values ('A02');
insert into lugar_parking values ('A03');
insert into lugar_parking values ('A04');
insert into lugar_parking values ('A05');
insert into lugar_parking values ('A06');
insert into lugar_parking values ('A07');
insert into lugar_parking values ('A08');

select * from parking

INSERT INTO Parking (lugar_parqueo, ID_vigilante, ID_conductor) VALUES ('A01', 1234, 1011087293);

select * from registro

create table registro(
    ID serial,
    ticket int,
    lugar_parqueo char(3),
    hora_ingreso time,
    fecha_ingreso date,
    hora_salida time,
    fecha_salida date,
    primary key (ID),
    foreign key (lugar_parqueo) references lugar_parking(lugar_parqueo),
	foreign key (ticket) references parking(ticket)
);
INSERT INTO registro (ticket,lugar_parqueo, hora_ingreso, fecha_ingreso) VALUES ('1','A01','04:00:00','17/08/2024' );
INSERT INTO registro (ticket,lugar_parqueo, hora_ingreso, fecha_ingreso) VALUES ('2','A02','04:00:00','17/08/2024' );
