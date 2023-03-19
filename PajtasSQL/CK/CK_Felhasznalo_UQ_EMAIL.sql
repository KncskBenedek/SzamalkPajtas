alter table Felhasznalo
add constraint CK_Felhasznalo_UQ_EMAIL check(email is null or dbo.UQ_email(email) = 1)