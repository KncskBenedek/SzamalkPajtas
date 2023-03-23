using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using PajtasBackend.Models;

namespace PajtasBackend.Models;

public partial class TarskeresoEContext : DbContext
{
    public TarskeresoEContext()
    {
    }

    public TarskeresoEContext(DbContextOptions<TarskeresoEContext> options)
        : base(options)
    {
    }

    public virtual DbSet<BovTulaj> BovTulajs { get; set; }

    public virtual DbSet<Egyebek> Egyebeks { get; set; }

    public virtual DbSet<Egymasnakmennyire> Egymasnakmennyires { get; set; }

    public virtual DbSet<Felhasznalo> Felhasznalos { get; set; }

    public virtual DbSet<Halmazertekek> Halmazertekeks { get; set; }

    public virtual DbSet<KerMindenE> KerMindenEs { get; set; }

    public virtual DbSet<Kerde> Kerdes { get; set; }

    public virtual DbSet<KijonekiE> KijonekiEs { get; set; }

    public virtual DbSet<Kimennyirejoneki> Kimennyirejonekis { get; set; }

    public virtual DbSet<MindenegyebF> MindenegyebFs { get; set; }

    public virtual DbSet<OsszeillokE> OsszeillokEs { get; set; }

    public virtual DbSet<SajMindenE> SajMindenEs { get; set; }

    public virtual DbSet<Sajat> Sajats { get; set; }
    public virtual DbSet<Kere> Keres { get; set; }


    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=localhost;Initial Catalog=Tarskereso_E;Integrated Security=True;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<BovTulaj>(entity =>
        {
            entity.HasKey(e => e.Tulajd);

            entity.ToTable("bov_tulaj", tb => tb.HasTrigger("sorszamozottan"));

            entity.Property(e => e.Tulajd)
                .ValueGeneratedNever()
                .HasColumnName("tulajd");
            entity.Property(e => e.Also).HasColumnName("also");
            entity.Property(e => e.Felso).HasColumnName("felso");
            entity.Property(e => e.Halmaz).HasColumnName("halmaz");
            entity.Property(e => e.Jelentés)
                .HasMaxLength(20)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("jelentés");
        });

        modelBuilder.Entity<Egyebek>(entity =>
        {
            entity.HasKey(e => new { e.Felhaszn, e.Kerdes }).HasName("PK_egyebek");

            entity.ToTable("Egyebek");

            entity.Property(e => e.Felhaszn).HasColumnName("felhaszn");
            entity.Property(e => e.Kerdes).HasColumnName("kerdes");
            entity.Property(e => e.Pont).HasColumnName("pont");
            entity.Property(e => e.SajatValasz).HasColumnName("sajat_valasz");
            entity.Property(e => e.VartValasz).HasColumnName("vart_valasz");

            entity.HasOne(d => d.FelhasznNavigation).WithMany(p => p.Egyebeks)
                .HasForeignKey(d => d.Felhaszn)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Egyebek_Felhasznalo");

            entity.HasOne(d => d.KerdesNavigation).WithMany(p => p.Egyebeks)
                .HasForeignKey(d => d.Kerdes)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Egyebek_Kerdes");
        });

        modelBuilder.Entity<Egymasnakmennyire>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("egymasnakmennyire");

            entity.Property(e => e.Egyik).HasColumnName("egyik");
            entity.Property(e => e.Egymáshoz).HasColumnName("egymáshoz");
            entity.Property(e => e.Másik).HasColumnName("másik");
            entity.Property(e => e.Oda).HasColumnName("oda");
            entity.Property(e => e.Vissza).HasColumnName("vissza");
        });

        modelBuilder.Entity<Felhasznalo>(entity =>
        {
            entity.HasKey(e => e.FhAzon);

            entity.ToTable("Felhasznalo");

            entity.HasIndex(e => e.Nev, "UQ__Felhaszn__DF900F678D1700D2").IsUnique();

            entity.Property(e => e.FhAzon).HasColumnName("fh_azon");
            entity.Property(e => e.Email)
                .HasMaxLength(70)
                .IsUnicode(false)
                .HasColumnName("email");
            entity.Property(e => e.Jelszo)
                .HasMaxLength(32)
                .IsUnicode(false)
                .HasColumnName("jelszo");
            entity.Property(e => e.Nev)
                .HasMaxLength(40)
                .IsUnicode(false)
                .HasColumnName("nev");

            entity.HasMany(d => d.Halmazertekeks).WithMany(p => p.Felhaszns)
                .UsingEntity<Dictionary<string, object>>(
                    "Kere",
                    r => r.HasOne<Halmazertekek>().WithMany()
                        .HasForeignKey("Tulajd", "Sorsz")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK_keres_halmazertekek"),
                    l => l.HasOne<Felhasznalo>().WithMany()
                        .HasForeignKey("Felhaszn")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK_keres_Felhasznalo"),
                    j =>
                    {
                        j.HasKey("Felhaszn", "Tulajd", "Sorsz");
                        j.ToTable("keres");
                        j.IndexerProperty<int>("Felhaszn").HasColumnName("felhaszn");
                        j.IndexerProperty<short>("Tulajd").HasColumnName("tulajd");
                        j.IndexerProperty<short>("Sorsz").HasColumnName("sorsz");
                    });
        });

        modelBuilder.Entity<Halmazertekek>(entity =>
        {
            entity.HasKey(e => new { e.Tulajd, e.Sorsz });

            entity.ToTable("halmazertekek", tb => tb.HasTrigger("aut_sorsz"));

            entity.HasIndex(e => new { e.Tulajd, e.Ertek }, "IX_halmazertekek").IsUnique();

            entity.Property(e => e.Tulajd).HasColumnName("tulajd");
            entity.Property(e => e.Sorsz).HasColumnName("sorsz");
            entity.Property(e => e.Ertek)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("ertek");

            entity.HasOne(d => d.TulajdNavigation).WithMany(p => p.Halmazertekeks)
                .HasForeignKey(d => d.Tulajd)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_halmazertekek_bov_tulaj");
        });

        modelBuilder.Entity<KerMindenE>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("ker_mindenE");

            entity.Property(e => e.Email)
                .HasMaxLength(70)
                .IsUnicode(false)
                .HasColumnName("email");
            entity.Property(e => e.Ertek)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("ertek");
            entity.Property(e => e.FhAzon).HasColumnName("fh_azon");
            entity.Property(e => e.Jelentés)
                .HasMaxLength(20)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("jelentés");
            entity.Property(e => e.Jelszo)
                .HasMaxLength(32)
                .IsUnicode(false)
                .HasColumnName("jelszo");
            entity.Property(e => e.Nev)
                .HasMaxLength(40)
                .IsUnicode(false)
                .HasColumnName("nev");
            entity.Property(e => e.Sorsz).HasColumnName("sorsz");
            entity.Property(e => e.Tulajd).HasColumnName("tulajd");
        });

        modelBuilder.Entity<Kerde>(entity =>
        {
            entity.HasKey(e => e.Kod);

            entity.Property(e => e.Kod).HasColumnName("kod");
            entity.Property(e => e.Szoveg)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("szoveg");
        });

        modelBuilder.Entity<KijonekiE>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("kijonekiE");

            entity.Property(e => e.Felhaszn).HasColumnName("felhaszn");
            entity.Property(e => e.Kinek).HasColumnName("kinek");
        });

        modelBuilder.Entity<Kimennyirejoneki>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("kimennyirejoneki");

            entity.Property(e => e.Ennyire).HasColumnName("ennyire");
            entity.Property(e => e.Felhaszn).HasColumnName("felhaszn");
            entity.Property(e => e.Kinek).HasColumnName("kinek");
        });

        modelBuilder.Entity<MindenegyebF>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("mindenegyebF");

            entity.Property(e => e.Email)
                .HasMaxLength(70)
                .IsUnicode(false)
                .HasColumnName("email");
            entity.Property(e => e.FhAzon).HasColumnName("fh_azon");
            entity.Property(e => e.Jelszo)
                .HasMaxLength(32)
                .IsUnicode(false)
                .HasColumnName("jelszo");
            entity.Property(e => e.Kod).HasColumnName("kod");
            entity.Property(e => e.Nev)
                .HasMaxLength(40)
                .IsUnicode(false)
                .HasColumnName("nev");
            entity.Property(e => e.Pont).HasColumnName("pont");
            entity.Property(e => e.SajatValasz).HasColumnName("sajat_valasz");
            entity.Property(e => e.Szoveg)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("szoveg");
            entity.Property(e => e.VartValasz).HasColumnName("vart_valasz");
        });

        modelBuilder.Entity<OsszeillokE>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("osszeillokE");

            entity.Property(e => e.Ki).HasColumnName("ki");
            entity.Property(e => e.Kivel).HasColumnName("kivel");
        });

        modelBuilder.Entity<SajMindenE>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("saj_mindenE");

            entity.Property(e => e.Email)
                .HasMaxLength(70)
                .IsUnicode(false)
                .HasColumnName("email");
            entity.Property(e => e.Ertek)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("ertek");
            entity.Property(e => e.FhAzon).HasColumnName("fh_azon");
            entity.Property(e => e.Jelentés)
                .HasMaxLength(20)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("jelentés");
            entity.Property(e => e.Jelszo)
                .HasMaxLength(32)
                .IsUnicode(false)
                .HasColumnName("jelszo");
            entity.Property(e => e.Nev)
                .HasMaxLength(40)
                .IsUnicode(false)
                .HasColumnName("nev");
            entity.Property(e => e.Sorsz).HasColumnName("sorsz");
            entity.Property(e => e.Tulajd).HasColumnName("tulajd");
        });

        modelBuilder.Entity<Sajat>(entity =>
        {
            entity.HasKey(e => new { e.Felhaszn, e.Tulajd });

            entity.ToTable("sajat");

            entity.Property(e => e.Felhaszn).HasColumnName("felhaszn");
            entity.Property(e => e.Tulajd).HasColumnName("tulajd");
            entity.Property(e => e.Sorsz).HasColumnName("sorsz");

            entity.HasOne(d => d.FelhasznNavigation).WithMany(p => p.Sajats)
                .HasForeignKey(d => d.Felhaszn)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_sajat_Felhasznalo");

            entity.HasOne(d => d.Halmazertekek).WithMany(p => p.Sajats)
                .HasForeignKey(d => new { d.Tulajd, d.Sorsz })
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_sajat_halmazertekek");
        });

        modelBuilder.Entity<Kere>(entity =>
        {
            entity.HasKey(e => new { e.Felhaszn, e.Tulajd, e.Sorsz });

            entity.ToTable("keres");

            entity.Property(e => e.Felhaszn).HasColumnName("felhaszn");
            entity.Property(e => e.Tulajd).HasColumnName("tulajd");
            entity.Property(e => e.Sorsz).HasColumnName("sorsz");

            entity.HasOne(d => d.Halmazertekek).WithMany(p => p.Keres)
                .HasForeignKey(d => new { d.Tulajd, d.Sorsz })
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_keres_halmazertekek");

            entity.HasOne(d => d.FelhasznNavigation).WithMany(p => p.Keres)
                .HasForeignKey(d => d.Felhaszn)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_keres_Felhasznalo");
        });


        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
