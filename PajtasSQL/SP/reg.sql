alter proc reg
(
	@nev varchar(40), @email varchar(40), @jelszo varchar(32)
)
as

	insert into Felhasznalo values (@nev, @email, @jelszo)
	declare @id int;
	set @id = IDENT_CURRENT('Felhasznalo');

	select *
	from Felhasznalo
	where fh_azon = @id