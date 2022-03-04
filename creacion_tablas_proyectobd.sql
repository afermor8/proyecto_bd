create database proyecto_bd;
create user 'usuario'@'localhost' identified by '1234';
grant all privileges on proyecto_bd.* to 'usuario'@'localhost';
flush privileges;
exit
mysql -u usuario -p
use proyecto_bd

create table actor
(
codigo varchar (5),
nombre varchar (15),
apellido varchar (15),
fechanac date,
constraint pk_actor primary key (codigo)
);

create table pelicula
(
codigo varchar (5),
titulo varchar (30),
fecha_estreno date,
puntuacion decimal (3,1),
lengua_original varchar (3),
constraint pk_pelicula primary key (codigo),
constraint puntuacion_ck check (puntuacion between 0 and 10)
);

create table pelicula_actor
(
codigo_actor varchar (5),
codigo_pelicula varchar (5),
tipo_personaje enum ('Principal','Secundario'),
constraint pk_pelicula_actor primary key (codigo_actor,codigo_pelicula),
constraint fk_codigo_actor foreign key (codigo_actor) references actor (codigo),
constraint fk_codigo_pelicula foreign key (codigo_pelicula) references pelicula (codigo)
);

insert into pelicula values ('MA001', 'Iron Man', '2008-05-02', 7.9, 'EN');
insert into pelicula values ('MA002', 'Thor', '2011-05-06', 7.0, 'EN');
insert into pelicula values ('MA003', 'Captain America: the first avenger', '2011-07-22', 6.9, 'EN');
insert into pelicula values ('MA004', 'The Avengers', '2012-05-04', 8, 'EN');
insert into pelicula values ('MA005', 'Guardians of the Galaxy', '2014-08-01', 8, 'EN');
insert into pelicula values ('MA006', 'Avengers: Age of Ultron', '2015-05-01', 7.3, 'EN');
insert into pelicula values ('MA007', 'Doctor Strange', '2016-11-04', 7.5, 'EN');
insert into pelicula values ('MA008', 'Spider-Man: Homecoming', '2017-07-07', 7.4, 'EN');
insert into pelicula values ('MA009', 'Black Panther', '2018-02-16', 7.3, 'EN');
insert into pelicula values ('MA010', 'Avengers: Infinity War', '2018-04-27', 8.4, 'EN');
insert into pelicula values ('MA011', 'Avengers: Endgame', '2019-04-26', 8.4, 'EN');

insert into actor values ('001','Robert', 'Downey', '1965-04-04');
insert into actor values ('002','Jon', 'Favreau', '1966-10-19');
insert into actor values ('003','Chris', 'Hemsworth', '1983-08-11');
insert into actor values ('004','Tom', 'Hiddleston', '1981-02-09');
insert into actor values ('005','Natalie', 'Portman', '1981-06-09');
insert into actor values ('006','Chris', 'Evans', '1981-06-13');
insert into actor values ('007','Sebastian', 'Stan', '1982-08-13');
insert into actor values ('008','Jeremy', 'Renner', '1971-01-07');
insert into actor values ('009','Scarlett', 'Johansson', '1984-11-22');
insert into actor values ('010','Mark', 'Ruffalo', '1967-11-22');
insert into actor values ('011','Clark', 'Gregg', '1962-04-02');
insert into actor values ('012','Samuel L.', 'Jackson', '1948-12-21');
insert into actor values ('013','Chris', 'Pratt', '1979-06-21');
insert into actor values ('014','Zoe', 'Saldaña', '1978-06-19');
insert into actor values ('015','Dave', 'Bautista', '1969-01-18');
insert into actor values ('016','Vin', 'Diesel', '1967-07-18');
insert into actor values ('017','Bradley', 'Cooper', '1975-01-05');
insert into actor values ('018','Michael', 'Rooker', '1955-04-06');
insert into actor values ('019','Elisabeth', 'Olsen', '1989-02-16');
insert into actor values ('020','Paul', 'Bettany', '1971-05-27');
insert into actor values ('021','Anthony', 'Mackie', '1978-09-23');
insert into actor values ('022','Bennedict', 'Cumberbatch', '1976-07-19');
insert into actor values ('023','Rachel', 'McAdams', '1978-11-17');
insert into actor values ('024','Tom', 'Holland', '1996-06-01');
insert into actor values ('025','Zendaya', 'Coleman', '1996-09-01');
insert into actor values ('026','Chadwick', 'Boseman', '1976-11-29');
insert into actor values ('027','Josh', 'Brolin', '1968-02-12');
insert into actor values ('028','Brie', 'Larson', '1989-10-01');

insert into pelicula_actor values ('001', 'MA001', 'Principal');
insert into pelicula_actor values ('002', 'MA001', 'Secundario');
insert into pelicula_actor values ('003', 'MA002', 'Principal');
insert into pelicula_actor values ('004', 'MA002', 'Principal');
insert into pelicula_actor values ('005', 'MA002', 'Principal');
insert into pelicula_actor values ('006', 'MA003', 'Principal');
insert into pelicula_actor values ('007', 'MA003', 'Secundario');
insert into pelicula_actor values ('001', 'MA004', 'Principal');
insert into pelicula_actor values ('002', 'MA004', 'Secundario');
insert into pelicula_actor values ('003', 'MA004', 'Principal');
insert into pelicula_actor values ('004', 'MA004', 'Principal');
insert into pelicula_actor values ('006', 'MA004', 'Principal');
insert into pelicula_actor values ('008', 'MA004', 'Principal');
insert into pelicula_actor values ('009', 'MA004', 'Principal');
insert into pelicula_actor values ('010', 'MA004', 'Principal');
insert into pelicula_actor values ('011', 'MA004', 'Secundario');
insert into pelicula_actor values ('012', 'MA004', 'Principal');
insert into pelicula_actor values ('013', 'MA005', 'Principal');
insert into pelicula_actor values ('014', 'MA005', 'Principal');
insert into pelicula_actor values ('015', 'MA005', 'Principal');
insert into pelicula_actor values ('016', 'MA005', 'Principal');
insert into pelicula_actor values ('017', 'MA005', 'Principal');
insert into pelicula_actor values ('018', 'MA005', 'Secundario');
insert into pelicula_actor values ('001', 'MA006', 'Principal');
insert into pelicula_actor values ('003', 'MA006', 'Principal');
insert into pelicula_actor values ('006', 'MA006', 'Principal');
insert into pelicula_actor values ('008', 'MA006', 'Principal');
insert into pelicula_actor values ('009', 'MA006', 'Principal');
insert into pelicula_actor values ('010', 'MA006', 'Principal');
insert into pelicula_actor values ('019', 'MA006', 'Principal');
insert into pelicula_actor values ('020', 'MA006', 'Principal');
insert into pelicula_actor values ('022', 'MA007', 'Principal');
insert into pelicula_actor values ('023', 'MA007', 'Secundario');
insert into pelicula_actor values ('024', 'MA008', 'Principal');
insert into pelicula_actor values ('025', 'MA008', 'Principal');
insert into pelicula_actor values ('001', 'MA008', 'Secundario');
insert into pelicula_actor values ('002', 'MA008', 'Secundario');
insert into pelicula_actor values ('026', 'MA009', 'Principal');
insert into pelicula_actor values ('027', 'MA010', 'Principal');
insert into pelicula_actor values ('001', 'MA010', 'Principal');
insert into pelicula_actor values ('003', 'MA010', 'Principal');
insert into pelicula_actor values ('004', 'MA010', 'Secundario');
insert into pelicula_actor values ('006', 'MA010', 'Principal');
insert into pelicula_actor values ('007', 'MA010', 'Secundario');
insert into pelicula_actor values ('009', 'MA010', 'Principal');
insert into pelicula_actor values ('010', 'MA010', 'Principal');
insert into pelicula_actor values ('012', 'MA010', 'Secundario');
insert into pelicula_actor values ('013', 'MA010', 'Principal');
insert into pelicula_actor values ('014', 'MA010', 'Principal');
insert into pelicula_actor values ('015', 'MA010', 'Principal');
insert into pelicula_actor values ('016', 'MA010', 'Principal');
insert into pelicula_actor values ('017', 'MA010', 'Principal');
insert into pelicula_actor values ('019', 'MA010', 'Principal');
insert into pelicula_actor values ('020', 'MA010', 'Principal');
insert into pelicula_actor values ('021', 'MA010', 'Secundario');
insert into pelicula_actor values ('022', 'MA010', 'Principal');
insert into pelicula_actor values ('024', 'MA010', 'Principal');
insert into pelicula_actor values ('026', 'MA010', 'Principal');
insert into pelicula_actor values ('001', 'MA011', 'Principal');
insert into pelicula_actor values ('003', 'MA011', 'Principal');
insert into pelicula_actor values ('006', 'MA011', 'Principal');
insert into pelicula_actor values ('008', 'MA011', 'Principal');
insert into pelicula_actor values ('009', 'MA011', 'Principal');
insert into pelicula_actor values ('010', 'MA011', 'Principal');
insert into pelicula_actor values ('027', 'MA011', 'Principal');
insert into pelicula_actor values ('007', 'MA011', 'Secundario');
insert into pelicula_actor values ('013', 'MA011', 'Secundario');
insert into pelicula_actor values ('014', 'MA011', 'Secundario');
insert into pelicula_actor values ('015', 'MA011', 'Secundario');
insert into pelicula_actor values ('016', 'MA011', 'Secundario');
insert into pelicula_actor values ('017', 'MA011', 'Secundario');
insert into pelicula_actor values ('019', 'MA011', 'Secundario');
insert into pelicula_actor values ('021', 'MA011', 'Secundario');
insert into pelicula_actor values ('022', 'MA011', 'Secundario');
insert into pelicula_actor values ('024', 'MA011', 'Secundario');
insert into pelicula_actor values ('026', 'MA011', 'Secundario');
insert into pelicula_actor values ('028', 'MA011', 'Secundario');
