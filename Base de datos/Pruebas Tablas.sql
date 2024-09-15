insert into vehiculo values ('JSY980','Camioneta');
insert into vehiculo values ('IEN90E','MOTO');
insert into vehiculo values ('MON210','CARRO');
insert into vehiculo values ('VAL216','CARRO');
insert into vehiculo values ('GAB031','CARRO');
insert into vehiculo values ('SMF666','CARRO');
insert into vehiculo values ('MAS564','CARRO');
insert into vehiculo values ('JAJ172','Moto');
insert into vehiculo values ('ABC123','Camioneta');
insert into vehiculo values ('ABC124','Camioneta');
insert into vehiculo values ('ABC125','Camioneta');
insert into vehiculo values ('ABC126','Camioneta');
insert into vehiculo values ('ABC127','Camioneta');
insert into vehiculo values ('OCT240','Camioneta');



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
insert into conductor values ('1022556624','Juliana Contreras','JAJ172');
insert into conductor values ('1022556621','Mora','ABC123');
insert into conductor values ('1022556622','Feid','ABC124');
insert into conductor values ('1022556623','Morat','ABC125');
insert into conductor values ('1022556625','Alvaro Diaz','ABC126');
insert into conductor values ('1022556626','Myke Towers','ABC127');
insert into conductor values ('1030254862','Mariana Sierra','OCT240');


select * from vigilante

insert into vigilante values ('1234','Pepito Perez');
insert into vigilante values ('1235','Pepita Perez');

select * from lugar_parking 

INSERT INTO lugar_parking (lugar_parqueo, disponible) VALUES ('A01', TRUE);
INSERT INTO lugar_parking (lugar_parqueo, disponible) VALUES ('A02', TRUE);
INSERT INTO lugar_parking (lugar_parqueo, disponible) VALUES ('A03', TRUE);
INSERT INTO lugar_parking (lugar_parqueo, disponible) VALUES ('A04', TRUE);
INSERT INTO lugar_parking (lugar_parqueo, disponible) VALUES ('A05', TRUE);
INSERT INTO lugar_parking (lugar_parqueo, disponible) VALUES ('A06', TRUE);
INSERT INTO lugar_parking (lugar_parqueo, disponible) VALUES ('A07', TRUE);
INSERT INTO lugar_parking (lugar_parqueo, disponible) VALUES ('A08', TRUE);
INSERT INTO lugar_parking (lugar_parqueo, disponible) VALUES ('A09', TRUE);
INSERT INTO lugar_parking (lugar_parqueo, disponible) VALUES ('A10', TRUE);
INSERT INTO lugar_parking (lugar_parqueo, disponible) VALUES ('A11', TRUE);
INSERT INTO lugar_parking (lugar_parqueo, disponible) VALUES ('A12', TRUE);
INSERT INTO lugar_parking (lugar_parqueo, disponible) VALUES ('A13', TRUE);
INSERT INTO lugar_parking (lugar_parqueo, disponible) VALUES ('A14', TRUE);
INSERT INTO lugar_parking (lugar_parqueo, disponible) VALUES ('A15', TRUE);



INSERT INTO registro (nombre_c, Placa_Vehiculo, hora_ingreso, fecha_ingreso)
VALUES ('Maluma Baby', 'JSY980', current_time,   current_date);
