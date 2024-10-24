drop database if exists agenzia_viaggi;

create database if not exists agenzia_viaggi;
use agenzia_viaggi;

create table if not exists turista(
	id_turista int primary key not null,
    nome varchar(64) not null,
    cognome varchar(64) not null,
    nascita date not null,
    telefono varchar(12) not null
);

create table if not exists viaggio(
	id_viaggio int primary key not null,
    localita varchar(64) not null,
    durata int not null,
    costo int not null,
    partenza date not null
);

create table if not exists prenotazione(
	id_prenotazione int primary key not null,
    data_prenotazione date not null,
	tipo_pagamento varchar(64) not null,
    
    id_turista int not null,
    id_viaggio int not null,
    
    foreign key (id_turista) references turista(id_turista),
    foreign key (id_viaggio) references viaggio(id_viaggio)
);

insert into turista values(0, 'nome_turista_1', 'cognome_turista_1', '2004-6-01', '333 333 3333');
insert into turista values(1, 'nome_turista_2', 'cognome_turista_2', '2004-6-02', '444 444 4444');
insert into turista values(2, 'nome_turista_3', 'cognome_turista_3', '2004-6-03', '555 555 5555');
insert into turista values(3, 'nome_turista_4', 'cognome_turista_4', '2004-6-04', '666 666 6666');
insert into turista values(4, 'nome_turista_5', 'cognome_turista_5', '2004-6-05', '777 777 7777');

insert into viaggio values(0, 'localita_1', 24*3, 200, '2022-1-01');
insert into viaggio values(1, 'localita_2', 24*9, 400, '2022-2-02');
insert into viaggio values(2, 'localita_3', 24*18, 600, '2022-3-03');

insert into prenotazione values(0, '2022-1-01', 'carta', 0, 0);
insert into prenotazione values(1, '2022-1-02', 'carta', 0, 1);
insert into prenotazione values(2, '2022-1-03', 'carta', 0, 2);

insert into prenotazione values(3, '2022-1-01', 'contante', 1, 0);
insert into prenotazione values(4, '2022-1-06', 'contante', 1, 1);

insert into prenotazione values(5, '2022-1-03', 'carta', 2, 1);
insert into prenotazione values(6, '2022-1-02', 'carta', 2, 2);

insert into prenotazione values(7, '2022-1-04', 'contante', 3, 0);
insert into prenotazione values(8, '2022-1-02', 'contante', 3, 2);

insert into prenotazione values(9, '2022-1-04', 'carta', 4, 0);
insert into prenotazione values(10, '2022-1-05', 'carta', 4, 1);
insert into prenotazione values(11, '2022-1-02', 'contante', 4, 2);