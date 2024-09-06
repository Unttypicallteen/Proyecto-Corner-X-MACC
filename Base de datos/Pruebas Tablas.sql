insert into vehiculo values ('JSY980','Camioneta');
insert into vehiculo values ('IEN90E','MOTO');
insert into vehiculo values ('MON210','CARRO');
insert into vehiculo values ('VAL216','CARRO');
insert into vehiculo values ('GAB031','CARRO');
insert into vehiculo values ('SMF666','CARRO');
insert into vehiculo values ('MAS564','CARRO');

select * from vehiculo

select * from Conductor

DELETE FROM CONDUCTOR

insert into conductor values ('1011087293','Maluma Baby','JSY980');
insert into conductor values ('1011087292','Pepito Perez','IEN90E');
insert into conductor values ('1011087291','Samuel Flores','SMF666');
insert into conductor values ('1011087294','Gabriela Aldana','GAB031');
insert into conductor values ('1011087298','Valeria Arce','VAL216');
insert into conductor values ('1011087297','Santiago Jorigua','MON210');
insert into conductor values ('1011087299','Mariana Ussa','MAS564');


select * from vigilante

insert into vigilante values ('1234','Pepito Perez');
insert into vigilante values ('1235','Pepita Perez');

select * from lugar_parking 

insert into lugar_parking values ('A01', TRUE);
insert into lugar_parking values ('A02', TRUE);
insert into lugar_parking values ('A03', TRUE);
insert into lugar_parking values ('A04', TRUE);
insert into lugar_parking values ('A05', TRUE);
insert into lugar_parking values ('A06', TRUE);
insert into lugar_parking values ('A07', TRUE);
insert into lugar_parking values ('A08', TRUE);


INSERT INTO registro (nombre_c, Placa_Vehiculo, hora_ingreso, fecha_ingreso)
VALUES ('Maluma Baby', 'JSY980', current_time,   current_date);
