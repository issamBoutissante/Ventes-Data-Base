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
insert into Fourniture values(2002,'S4004',200)
--   Les Etapes
--   1 - compter combien des produits originaire de marrakech (N_Produit_P)
--   2 - compter combien des produits originaire de marrakech chaque fournisseur fournisse(N_Produit_F)
--   2 - comparer (N_Produit_P) et (N_Produit_F)

select num_f from Fourniture 
join produit  on Fourniture.code_p=Produit.code_p
where origine='marrakech'
group by num_f
having count(distinct Fourniture.code_p)=(select count(code_p) from Produit where origine ='marrakech')



--g) Noms et villes des fournisseurs qui  fournissent au moins un produit originaire de leur ville.
select distinct nom_f,ville from Fourniture 
join Produit on Fourniture.code_p=Produit.code_p 
join Fournisseur on Fournisseur.num_f=Fourniture.num_f
where origine=ville

--h) Numéros des fournisseurs qui ne fournissent que des produits ayant le prix dépasse 800.
select distinct nom_f,ville from Fourniture 
join Produit on Fourniture.code_p=Produit.code_p 
join Fournisseur on Fournisseur.num_f=Fourniture.num_f
where prix_u>800

















