insert into vehiculo values ('JSY980','Camioneta');
insert into vehiculo values ('IEN90E','Moto');
insert into vehiculo values ('MON210','Camioneta');
insert into vehiculo values ('VAL216','Camioneta');
insert into vehiculo values ('GAB031','Carro');
insert into vehiculo values ('SMF666','Carro');
insert into vehiculo values ('MAS564','Carro');
insert into vehiculo values ('JAJ172','Moto');
insert into vehiculo values ('ABC123','Camioneta');
insert into vehiculo values ('ABC124','Camioneta');
insert into vehiculo values ('ABC125','Camioneta');
insert into vehiculo values ('ABC126','Camioneta');
insert into vehiculo values ('ABC127','Camioneta');
insert into vehiculo values ('OCT240','Camioneta');
insert into vehiculo values ('ADM001', 'Carro');
insert into vehiculo values ('ADM002', 'Camioneta');
insert into vehiculo values ('ADM003', 'Carro');
insert into vehiculo values ('ADM004', 'Camioneta');
insert into vehiculo values ('ADM005', 'Carro');
insert into vehiculo values ('ADM006', 'Camioneta');
insert into vehiculo values ('ADM007', 'Carro');
insert into vehiculo values ('ADM008', 'Camioneta');
insert into vehiculo values ('ADM009', 'Carro');
insert into vehiculo values ('ADM010', 'Camioneta');
insert into vehiculo values ('ADM011', 'Carro');
insert into vehiculo values ('ADM012', 'Camioneta');
insert into vehiculo values ('ADM013', 'Carro');
insert into vehiculo values ('ADM014', 'Camioneta');
insert into vehiculo values ('ADM015', 'Camioneta');


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
insert into conductor values ('1023456789', 'Administrativo 1', 'ADM001');
insert into conductor values ('1045678932', 'Administrativo 2', 'ADM002');
insert into conductor values ('1067892345', 'Administrativo 3', 'ADM003');
insert into conductor values ('1078912345', 'Administrativo 4', 'ADM004');
insert into conductor values ('1091234567', 'Administrativo 5', 'ADM005');
insert into conductor values ('1023456781', 'Administrativo 6', 'ADM006');
insert into conductor values ('1034567892', 'Administrativo 7', 'ADM007');
insert into conductor values ('1045678923', 'Administrativo 8', 'ADM008');
insert into conductor values ('1056789123', 'Administrativo 9', 'ADM009');
insert into conductor values ('1067891234', 'Administrativo 10', 'ADM010');
insert into conductor values ('1078912341', 'Administrativo 11', 'ADM011');
insert into conductor values ('1089123452', 'Administrativo 12', 'ADM012');
insert into conductor values ('1091234512', 'Administrativo 13', 'ADM013');
insert into conductor values ('1022345673', 'Administrativo 14', 'ADM014');
insert into conductor values ('1034567814', 'Administrativo 15', 'ADM015');




insert into vigilante values ('1234','Pepito Perez');
insert into vigilante values ('1235','Pepita Perez');


-- Inserciones para el piso A
INSERT INTO lugar_parking (lugar_parqueo, disponible) VALUES
('A01', TRUE), ('A02', TRUE), ('A03', TRUE), ('A04', TRUE), ('A05', TRUE),
('A06', TRUE), ('A07', TRUE), ('A08', TRUE), ('A09', TRUE), ('A10', TRUE),
('A11', TRUE), ('A12', TRUE), ('A13', TRUE), ('A14', TRUE), ('A15', TRUE);

-- Inserciones para el piso B
INSERT INTO lugar_parking (lugar_parqueo, disponible) VALUES
('B01', TRUE), ('B02', TRUE), ('B03', TRUE), ('B04', TRUE), ('B05', TRUE),
('B06', TRUE), ('B07', TRUE), ('B08', TRUE), ('B09', TRUE), ('B10', TRUE),
('B11', TRUE), ('B12', TRUE), ('B13', TRUE), ('B14', TRUE), ('B15', TRUE);

-- Inserciones para el piso C
INSERT INTO lugar_parking (lugar_parqueo, disponible) VALUES
('C01', TRUE), ('C02', TRUE), ('C03', TRUE), ('C04', TRUE), ('C05', TRUE),
('C06', TRUE), ('C07', TRUE), ('C08', TRUE), ('C09', TRUE), ('C10', TRUE),
('C11', TRUE), ('C12', TRUE), ('C13', TRUE), ('C14', TRUE), ('C15', TRUE);

-- Inserciones para el piso D
INSERT INTO lugar_parking (lugar_parqueo, disponible) VALUES
('D01', TRUE), ('D02', TRUE), ('D03', TRUE), ('D04', TRUE), ('D05', TRUE),
('D06', TRUE), ('D07', TRUE), ('D08', TRUE), ('D09', TRUE), ('D10', TRUE),
('D11', TRUE), ('D12', TRUE), ('D13', TRUE), ('D14', TRUE), ('D15', TRUE);
