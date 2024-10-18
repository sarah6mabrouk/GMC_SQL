create table Catégories(
	CatégorieID int primary key,
	NomCatégorie varchar(50));

exec sp_help 'Catégories';

create table Produits(
	ProduitID int primary key,
	NomProduit varchar(200) not null,
	Prix decimal(10, 2) check (Prix>0),
	QuantitéEnStock int check (QuantitéEnStock >= 0),
	CatégorieID int 
	foreign key (CatégorieID) references Catégories(CatégorieID),
	Description varchar(255)
);

exec sp_help 'Produits';

create table Commandes(
	CommandeID int primary key,
	ProduitID int,
	foreign key (ProduitID) references Produits(ProduitID),
	QuantitéCommandée int check (QuantitéCommandée>0),
	DateCommande date not null default getdate(),
	unique (CommandeID, DateCommande) );

exec sp_help 'Commandes';

insert into Catégories values 
(1, 'Electronique'), 
(2, 'Vêtements'), 
(3, 'Alimentation');

select*from Catégories;

insert into Produits values 
	(01, 'Télévision', 499.99, 50, 1, 'Télévision 42 pouces HD'),
	(02, 'T-shirt', 19.99, 200, 2, 'T-shirt 100% coton'),
	(03, 'Chocolat', 2.99, 500, 3, 'Barre de chocolat noir');

select*from Produits;

insert into Commandes (CommandeID, ProduitID, QuantitéCommandée) values 
	(1,1,10), 
	(2,2,50), 
	(3,3,100);

select*from Commandes;


ALTER TABLE Produits
ALTER COLUMN CodeProduit int NOT NULL;

ALTER TABLE Produits
ADD CONSTRAINT DF_CodeProduit DEFAULT 1 FOR CodeProduit;

alter table Produits add constraint uk_CodeProduit unique (CodeProduit);
alter table Catégories add DescriptionCatégorie varchar(300);
alter table Produits add Fournisseur varchar(100);
alter table Produits alter column NomProduit varchar(150);
alter table Produits drop column Description;








