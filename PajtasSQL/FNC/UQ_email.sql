create function UQ_email
(
	@email varchar(40)
)
returns int
as
begin
	return (
		select count(*)
		from Felhasznalo
		where email is not null
		and email = @email
	)
end