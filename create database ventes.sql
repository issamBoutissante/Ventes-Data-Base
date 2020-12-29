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
nom_p varchar(20),
origine varchar(10),
prix_u money
)

create table Fourniture(
num_f int ,
code_p varchar(10),
quantite int,
constraint fk_num_f_fournisseur foreign key(num_f) references Fournisseur(num_f),
constraint fk_code_p_produit foreign key(code_p) references Produit(code_p),
constraint pk_num_f_code_p primary key(num_f,code_p)
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

--a) Liste des fournisseurs qui fournissent au moins un produit
select distinct num_f from Fourniture 

--b) Numéros des fournisseurs qui fournissent au moins le produit dont le numéro est C2002
select num_f from Fourniture where code_p = 'C2002'

--c) Liste des fournisseurs qui fournissent quelque chose d’autre que le produit C2002
select num_f from Fourniture  where code_p <> 'C2002'

--d) Numéros et noms des fournisseurs qui ne fournissent rien.
select Fournisseur.num_f,nom_f from Fourniture full join Fournisseur 
on Fourniture.num_f=Fournisseur.num_f where code_p is Null

--e) Nom des fournisseurs trouvé en Casa
select nom_f from Fournisseur where ville='Casa'

--f) Numéros des fournisseurs qui fournissent tous les produits originaire de Marrakech
insert into Fourniture values(2002,'C1001',200)


select num_f as ori from Fourniture 
join Produit on Fourniture.code_p = Produit.code_p 
group by num_f  having count(distinct origine)=1




--g) Noms et villes des fournisseurs qui  fournissent au moins un produit originaire de leur ville.
select Fourniture.num_f,ville from Fourniture 
join Produit on Fourniture.code_p=Produit.code_p 
join Fournisseur on Fournisseur.num_f=Fourniture.num_f
where origine='marrakech'




















