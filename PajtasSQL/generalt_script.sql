USE [Tarskereso_E]
GO
/****** Object:  Trigger [aut_sorsz]    Script Date: 2023. 03. 19. 19:35:36 ******/
DROP TRIGGER [dbo].[aut_sorsz]
GO
/****** Object:  Trigger [sorszamozottan]    Script Date: 2023. 03. 19. 19:35:36 ******/
DROP TRIGGER [dbo].[sorszamozottan]
GO
/****** Object:  StoredProcedure [dbo].[reg]    Script Date: 2023. 03. 19. 19:35:36 ******/
DROP PROCEDURE [dbo].[reg]
GO
ALTER TABLE [dbo].[keres] DROP CONSTRAINT [CK_keres_csakketto]
GO
ALTER TABLE [dbo].[halmazertekek] DROP CONSTRAINT [CK_halmazertekek]
GO
ALTER TABLE [dbo].[Felhasznalo] DROP CONSTRAINT [CK_Felhasznalo_UQ_EMAIL]
GO
ALTER TABLE [dbo].[Egyebek] DROP CONSTRAINT [CK_Egyebek]
GO
ALTER TABLE [dbo].[sajat] DROP CONSTRAINT [FK_sajat_halmazertekek]
GO
ALTER TABLE [dbo].[sajat] DROP CONSTRAINT [FK_sajat_Felhasznalo]
GO
ALTER TABLE [dbo].[keres] DROP CONSTRAINT [FK_keres_halmazertekek]
GO
ALTER TABLE [dbo].[keres] DROP CONSTRAINT [FK_keres_Felhasznalo]
GO
ALTER TABLE [dbo].[halmazertekek] DROP CONSTRAINT [FK_halmazertekek_bov_tulaj]
GO
ALTER TABLE [dbo].[Egyebek] DROP CONSTRAINT [FK_Egyebek_Kerdes]
GO
ALTER TABLE [dbo].[Egyebek] DROP CONSTRAINT [FK_Egyebek_Felhasznalo]
GO
/****** Object:  View [dbo].[mindenegyebF]    Script Date: 2023. 03. 19. 19:35:36 ******/
DROP VIEW [dbo].[mindenegyebF]
GO
/****** Object:  Table [dbo].[Kerdes]    Script Date: 2023. 03. 19. 19:35:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Kerdes]') AND type in (N'U'))
DROP TABLE [dbo].[Kerdes]
GO
/****** Object:  View [dbo].[egymasnakmennyire]    Script Date: 2023. 03. 19. 19:35:36 ******/
DROP VIEW [dbo].[egymasnakmennyire]
GO
/****** Object:  View [dbo].[kimennyirejoneki]    Script Date: 2023. 03. 19. 19:35:36 ******/
DROP VIEW [dbo].[kimennyirejoneki]
GO
/****** Object:  UserDefinedFunction [dbo].[ki_mennyire_jo_neki]    Script Date: 2023. 03. 19. 19:35:36 ******/
DROP FUNCTION [dbo].[ki_mennyire_jo_neki]
GO
/****** Object:  Table [dbo].[Egyebek]    Script Date: 2023. 03. 19. 19:35:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Egyebek]') AND type in (N'U'))
DROP TABLE [dbo].[Egyebek]
GO
/****** Object:  View [dbo].[saj_mindenE]    Script Date: 2023. 03. 19. 19:35:36 ******/
DROP VIEW [dbo].[saj_mindenE]
GO
/****** Object:  View [dbo].[ker_mindenE]    Script Date: 2023. 03. 19. 19:35:36 ******/
DROP VIEW [dbo].[ker_mindenE]
GO
/****** Object:  Table [dbo].[halmazertekek]    Script Date: 2023. 03. 19. 19:35:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[halmazertekek]') AND type in (N'U'))
DROP TABLE [dbo].[halmazertekek]
GO
/****** Object:  View [dbo].[kijonekiE]    Script Date: 2023. 03. 19. 19:35:36 ******/
DROP VIEW [dbo].[kijonekiE]
GO
/****** Object:  View [dbo].[osszeillokE]    Script Date: 2023. 03. 19. 19:35:36 ******/
DROP VIEW [dbo].[osszeillokE]
GO
/****** Object:  Table [dbo].[Felhasznalo]    Script Date: 2023. 03. 19. 19:35:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Felhasznalo]') AND type in (N'U'))
DROP TABLE [dbo].[Felhasznalo]
GO
/****** Object:  UserDefinedFunction [dbo].[kijoneki3]    Script Date: 2023. 03. 19. 19:35:36 ******/
DROP FUNCTION [dbo].[kijoneki3]
GO
/****** Object:  Table [dbo].[sajat]    Script Date: 2023. 03. 19. 19:35:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sajat]') AND type in (N'U'))
DROP TABLE [dbo].[sajat]
GO
/****** Object:  Table [dbo].[keres]    Script Date: 2023. 03. 19. 19:35:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[keres]') AND type in (N'U'))
DROP TABLE [dbo].[keres]
GO
/****** Object:  Table [dbo].[bov_tulaj]    Script Date: 2023. 03. 19. 19:35:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[bov_tulaj]') AND type in (N'U'))
DROP TABLE [dbo].[bov_tulaj]
GO
/****** Object:  UserDefinedFunction [dbo].[UQ_email]    Script Date: 2023. 03. 19. 19:35:36 ******/
DROP FUNCTION [dbo].[UQ_email]
GO
/****** Object:  UserDefinedFunction [dbo].[korlatos]    Script Date: 2023. 03. 19. 19:35:36 ******/
DROP FUNCTION [dbo].[korlatos]
GO
/****** Object:  UserDefinedFunction [dbo].[csakketto]    Script Date: 2023. 03. 19. 19:35:36 ******/
DROP FUNCTION [dbo].[csakketto]
GO
USE [master]
GO
/****** Object:  Database [Tarskereso_E]    Script Date: 2023. 03. 19. 19:35:36 ******/
DROP DATABASE [Tarskereso_E]
GO
/****** Object:  Database [Tarskereso_E]    Script Date: 2023. 03. 19. 19:35:36 ******/
CREATE DATABASE [Tarskereso_E]
GO
USE [Tarskereso_E]
GO
/****** Object:  UserDefinedFunction [dbo].[csakketto]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- author: Karácsony Péter - GDF
CREATE FUNCTION [dbo].[csakketto]
	(@f INT,@t SMALLINT)
RETURNS INT
AS 
BEGIN
	DECLARE @ok INT =0
	DECLARE @db INT =0
	IF 0=(SELECT halmaz FROM bov_tulaj WHERE tulajd=@t) 
		SELECT @db=COUNT(*) FROM keres WHERE felhaszn=@f AND tulajd=@t
	IF @db>2
		SET @ok=1

	RETURN @ok
END

--SELECT dbo.csakketto(10,1)

GO
/****** Object:  UserDefinedFunction [dbo].[korlatos]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- author Kupcsikné Fitus Ilona, GDF

CREATE FUNCTION [dbo].[korlatos]
(
	@tulajd smallint, @sorsz smallint
)
RETURNS tinyint
AS
BEGIN
	DECLARE @vissza tinyint

	if
	(SELECT felso from bov_tulaj where tulajd=@tulajd)<@sorsz 
	or
	(SELECT also from bov_tulaj where tulajd=@tulajd)>@sorsz 
		set @vissza=0
	else
		set @vissza=1
	
	
	RETURN @vissza

END

GO
/****** Object:  UserDefinedFunction [dbo].[UQ_email]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[UQ_email]
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
GO
/****** Object:  Table [dbo].[bov_tulaj]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bov_tulaj](
	[tulajd] [smallint] NOT NULL,
	[jelentés] [char](20) NULL,
	[also] [int] NULL,
	[felso] [int] NULL,
	[halmaz] [bit] NULL,
 CONSTRAINT [PK_bov_tulaj] PRIMARY KEY CLUSTERED 
(
	[tulajd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[keres]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[keres](
	[felhaszn] [int] NOT NULL,
	[tulajd] [smallint] NOT NULL,
	[sorsz] [smallint] NOT NULL,
 CONSTRAINT [PK_keres] PRIMARY KEY CLUSTERED 
(
	[felhaszn] ASC,
	[tulajd] ASC,
	[sorsz] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sajat]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sajat](
	[felhaszn] [int] NOT NULL,
	[tulajd] [smallint] NOT NULL,
	[sorsz] [smallint] NOT NULL,
 CONSTRAINT [PK_sajat] PRIMARY KEY CLUSTERED 
(
	[felhaszn] ASC,
	[tulajd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[kijoneki3]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- author Kupcsikné Fitus Ilona, GDF

CREATE FUNCTION [dbo].[kijoneki3] 
(	
	@kinek int
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT s.felhaszn from sajat s
	where felhaszn <>@kinek 
	and (
		sorsz between (select MIN(sorsz) from keres K inner join bov_tulaj T on k.tulajd=t.tulajd
						where  felhaszn=@kinek and k.tulajd=s.tulajd and halmaz=0)
						and
						(select MAX(sorsz) from keres K inner join bov_tulaj T on k.tulajd=t.tulajd
						where  felhaszn=@kinek and k.tulajd=s.tulajd and halmaz=0)
		OR 
		sorsz IN (select sorsz from keres K inner join bov_tulaj T on k.tulajd=t.tulajd
						where  felhaszn=@kinek and k.tulajd=s.tulajd and halmaz=1)
						)
	group by s.felhaszn 
	having count(*) = (select COUNT(distinct tulajd) from keres where felhaszn=@kinek)
)


--select * from dbo.kijoneki3(10)

GO
/****** Object:  Table [dbo].[Felhasznalo]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Felhasznalo](
	[fh_azon] [int] IDENTITY(1,1) NOT NULL,
	[nev] [varchar](40) NOT NULL UNIQUE,
	[email] [varchar](70) NULL,
	[jelszo] [varchar](32) NOT NULL,
 CONSTRAINT [PK_Felhasznalo] PRIMARY KEY CLUSTERED 
(
	[fh_azon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[osszeillokE]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- author Kupcsikné Fitus Ilona, GDF

CREATE view [dbo].[osszeillokE]
as
SELECT Felhasznalo.fh_azon as ki,f.felhaszn as kivel 
	FROM Felhasznalo OUTER APPLY dbo.kijoneki3(fh_azon) AS f
	where fh_azon IN (select felhaszn from dbo.kijoneki3(f.felhaszn))

GO
/****** Object:  View [dbo].[kijonekiE]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- author Karácsony Péter, GDF

CREATE view [dbo].[kijonekiE]
as 
SELECT Felhasznalo.fh_azon AS kinek,f.* 
	FROM Felhasznalo OUTER APPLY dbo.kijoneki3(fh_azon) AS f

GO
/****** Object:  Table [dbo].[halmazertekek]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[halmazertekek](
	[tulajd] [smallint] NOT NULL,
	[sorsz] [smallint] NOT NULL,
	[ertek] [char](10) NOT NULL,
 CONSTRAINT [PK_halmazertekek] PRIMARY KEY CLUSTERED 
(
	[tulajd] ASC,
	[sorsz] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_halmazertekek] UNIQUE NONCLUSTERED 
(
	[tulajd] ASC,
	[ertek] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ker_mindenE]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- author Kupcsikné Fitus Ilona, GDF

CREATE view [dbo].[ker_mindenE]
as
select f.*, k.tulajd, t.jelentés, k.sorsz, e.ertek  
from keres k, halmazertekek e, bov_tulaj t, Felhasznalo f
where k.felhaszn=f.fh_azon and k.tulajd=e.tulajd and k.sorsz=e.sorsz and e.tulajd=t.tulajd

GO
/****** Object:  View [dbo].[saj_mindenE]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- author Kupcsikné Fitus Ilona, GDF

CREATE view [dbo].[saj_mindenE]
as
select f.*, s.tulajd, t.jelentés, s.sorsz, e.ertek  
from sajat s, halmazertekek e, bov_tulaj t, Felhasznalo f
where s.felhaszn=f.fh_azon and s.tulajd=e.tulajd and s.sorsz=e.sorsz and e.tulajd=t.tulajd

GO
/****** Object:  Table [dbo].[Egyebek]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Egyebek](
	[felhaszn] [int] NOT NULL,
	[kerdes] [bigint] NOT NULL,
	[sajat_valasz] [bit] NOT NULL,
	[vart_valasz] [bit] NOT NULL,
	[pont] [smallint] NOT NULL,
 CONSTRAINT [PK_egyebek] PRIMARY KEY CLUSTERED 
(
	[felhaszn] ASC,
	[kerdes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[ki_mennyire_jo_neki]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[ki_mennyire_jo_neki]
(
@kinek int
)
returns table

as 
return 
(
select s.felhaszn, 
 (cast(sum(k.pont) as real)/(select cast(sum(pont)as real) from egyebek where felhaszn=@kinek)) as ennyire
from egyebek k, egyebek s
where k.kerdes=s.kerdes and k.felhaszn<>s.felhaszn
and k.felhaszn=@kinek
and
(
s.sajat_valasz=k.vart_valasz 
)
group by s.felhaszn
)
GO
/****** Object:  View [dbo].[kimennyirejoneki]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[kimennyirejoneki]
as
SELECT Felhasznalo.fh_azon AS kinek,f.* 
	FROM Felhasznalo OUTER APPLY dbo.ki_mennyire_jo_neki(fh_azon) AS f
GO
/****** Object:  View [dbo].[egymasnakmennyire]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[egymasnakmennyire]
as

select oda.kinek as egyik, oda.Felhaszn as másik, 
		oda.ennyire as oda, vissza.ennyire as vissza,
		SQRT(oda.ennyire*vissza.ennyire)as egymáshoz 
from (select * from kimennyirejoneki) oda INNER JOIN (select * from kimennyirejoneki) vissza
ON (oda.kinek=vissza.felhaszn and oda.felhaszn=vissza.kinek)
WHERE oda.kinek<oda.felhaszn
GO
/****** Object:  Table [dbo].[Kerdes]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kerdes](
	[kod] [bigint] IDENTITY(1,1) NOT NULL,
	[szoveg] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Kerdes] PRIMARY KEY CLUSTERED 
(
	[kod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[mindenegyebF]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[mindenegyebF]
as

select f.*, k.*, e.sajat_valasz, e.vart_valasz, e.pont  
from Egyebek e, Kerdes k, Felhasznalo f
where e.felhaszn=f.fh_azon and e.kerdes=k.kod
GO
ALTER TABLE [dbo].[Egyebek]  WITH CHECK ADD  CONSTRAINT [FK_Egyebek_Felhasznalo] FOREIGN KEY([felhaszn])
REFERENCES [dbo].[Felhasznalo] ([fh_azon])
GO
ALTER TABLE [dbo].[Egyebek] CHECK CONSTRAINT [FK_Egyebek_Felhasznalo]
GO
ALTER TABLE [dbo].[Egyebek]  WITH CHECK ADD  CONSTRAINT [FK_Egyebek_Kerdes] FOREIGN KEY([kerdes])
REFERENCES [dbo].[Kerdes] ([kod])
GO
ALTER TABLE [dbo].[Egyebek] CHECK CONSTRAINT [FK_Egyebek_Kerdes]
GO
ALTER TABLE [dbo].[halmazertekek]  WITH CHECK ADD  CONSTRAINT [FK_halmazertekek_bov_tulaj] FOREIGN KEY([tulajd])
REFERENCES [dbo].[bov_tulaj] ([tulajd])
GO
ALTER TABLE [dbo].[halmazertekek] CHECK CONSTRAINT [FK_halmazertekek_bov_tulaj]
GO
ALTER TABLE [dbo].[keres]  WITH CHECK ADD  CONSTRAINT [FK_keres_Felhasznalo] FOREIGN KEY([felhaszn])
REFERENCES [dbo].[Felhasznalo] ([fh_azon])
GO
ALTER TABLE [dbo].[keres] CHECK CONSTRAINT [FK_keres_Felhasznalo]
GO
ALTER TABLE [dbo].[keres]  WITH CHECK ADD  CONSTRAINT [FK_keres_halmazertekek] FOREIGN KEY([tulajd], [sorsz])
REFERENCES [dbo].[halmazertekek] ([tulajd], [sorsz])
GO
ALTER TABLE [dbo].[keres] CHECK CONSTRAINT [FK_keres_halmazertekek]
GO
ALTER TABLE [dbo].[sajat]  WITH CHECK ADD  CONSTRAINT [FK_sajat_Felhasznalo] FOREIGN KEY([felhaszn])
REFERENCES [dbo].[Felhasznalo] ([fh_azon])
GO
ALTER TABLE [dbo].[sajat] CHECK CONSTRAINT [FK_sajat_Felhasznalo]
GO
ALTER TABLE [dbo].[sajat]  WITH CHECK ADD  CONSTRAINT [FK_sajat_halmazertekek] FOREIGN KEY([tulajd], [sorsz])
REFERENCES [dbo].[halmazertekek] ([tulajd], [sorsz])
GO
ALTER TABLE [dbo].[sajat] CHECK CONSTRAINT [FK_sajat_halmazertekek]
GO
ALTER TABLE [dbo].[Egyebek]  WITH CHECK ADD  CONSTRAINT [CK_Egyebek] CHECK  (([pont]=(1) OR [pont]=(10) OR [pont]=(50) OR [pont]=(100) OR [pont]=(250)))
GO
ALTER TABLE [dbo].[Egyebek] CHECK CONSTRAINT [CK_Egyebek]
GO
ALTER TABLE [dbo].[Felhasznalo]  WITH CHECK ADD  CONSTRAINT [CK_Felhasznalo_UQ_EMAIL] CHECK  (([email] IS NULL OR [dbo].[UQ_email]([email])=(1)))
GO
ALTER TABLE [dbo].[Felhasznalo] CHECK CONSTRAINT [CK_Felhasznalo_UQ_EMAIL]
GO
ALTER TABLE [dbo].[halmazertekek]  WITH CHECK ADD  CONSTRAINT [CK_halmazertekek] CHECK  (([dbo].[korlatos]([tulajd],[sorsz])=(1)))
GO
ALTER TABLE [dbo].[halmazertekek] CHECK CONSTRAINT [CK_halmazertekek]
GO
ALTER TABLE [dbo].[keres]  WITH CHECK ADD  CONSTRAINT [CK_keres_csakketto] CHECK  (([dbo].[csakketto]([felhaszn],[tulajd])=(0)))
GO
ALTER TABLE [dbo].[keres] CHECK CONSTRAINT [CK_keres_csakketto]
GO
/****** Object:  StoredProcedure [dbo].[reg]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[reg]
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
GO
/****** Object:  Trigger [dbo].[sorszamozottan]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- author Kupcsikné Fitus Ilona, GDF


CREATE TRIGGER [dbo].[sorszamozottan] 
   ON  [dbo].[bov_tulaj] 
   AFTER INSERT
AS 
BEGIN
	
	
	with ertekek(tulajd, sorsz, ertek)
	as (
	select tulajd, also,CAST(also as CHAR(10))  
	from inserted where halmaz=0
	union all
	select i.Tulajd, sorsz+1, CAST(sorsz+1 as CHAR(10)) from inserted i, ertekek e 
	where sorsz<felso and i.tulajd=e.tulajd and halmaz=0 )
	select * into #halmaz from ertekek;
	
	insert into halmazertekek select * from #halmaz;
	
	drop table #halmaz;

END

GO
ALTER TABLE [dbo].[bov_tulaj] ENABLE TRIGGER [sorszamozottan]
GO
/****** Object:  Trigger [dbo].[aut_sorsz]    Script Date: 2023. 03. 19. 19:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- author Kupcsikné Fitus Ilona, GDF

CREATE TRIGGER [dbo].[aut_sorsz] 
   ON  [dbo].[halmazertekek] 
   instead of INSERT
AS 
BEGIN
	declare @kov smallint,	@input bit
	set @input=(select distinct halmaz from bov_tulaj b, inserted i where b.tulajd=i.tulajd)
if @input=1
begin
	select @kov=max(sorsz) from halmazertekek 
	where tulajd=(select tulajd from inserted)
	if @kov is null
		set @kov=0
	
	insert into halmazertekek
	select tulajd, @kov+1, ertek from inserted
end
else
	insert into halmazertekek
	select * from inserted
	
END

GO
ALTER TABLE [dbo].[halmazertekek] ENABLE TRIGGER [aut_sorsz]
GO
USE [master]
GO
ALTER DATABASE [Tarskereso_E] SET  READ_WRITE 
GO
