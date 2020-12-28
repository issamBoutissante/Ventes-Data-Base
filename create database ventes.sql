create database Ventes
use Ventes

--creation des tables
create table Fournisseur(
num_f int primary key,
nom_f varchar(10),
ville varchar(10)
)

create table Produit(
code_p varchar(10) primary key,
nom_p varchar(10),
origine varchar(10),
prix_u money
)

create table Fourniture(
num_f int ,
code_p varchar(10),
quantite int,
constraint fk_fourniture_fournisseur foreign key(num_f) references Fournisseur(num_f),
constraint fk_fourniture_produit foreign key(code_p) references Produit(code_p)
)

--remplissage des tables
--      la table Fournisseur
insert into Fournisseur values(1001,'Hassan','Casa')
insert into Fournisseur values(2002,'Brahim','Marrakech')
insert into Fournisseur values(3003,'Ali','Agadir')
insert into Fournisseur values(4004,'Said','Tanger')

--       la table Produit 
insert into Produit values('C1001','Cable','Casa',10)
insert into Produit values('C2002','Connecteur','Marrakech',2)
insert into Produit values('R3003','Routeur','Casa',700)
insert into Produit values('S4004','Switch','Marrakech',800)
insert into Produit values('CR1001','Carte reseau','Marrakech',300)

--        la tabel Fourniteur
insert into Fourniture values(1001,'C1001',300)
insert into Fourniture values(3003,'S4004',80)
insert into Fourniture values(2002,'C2002',1000)
insert into Fourniture values(1001,'R3003',140)
insert into Fourniture values(2002,'CR1001',200)

--         listes de fournisseur qui fournissent ou moins un produit
select * from forin




