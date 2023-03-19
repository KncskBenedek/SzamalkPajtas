using System;
using System.Collections.Generic;

namespace PajtasBackend.Models;

public partial class Felhasznalo
{
    public int FhAzon { get; set; }

    public string Nev { get; set; } = null!;

    public string? Email { get; set; }

    public string Jelszo { get; set; } = null!;

    public virtual ICollection<Egyebek> Egyebeks { get; } = new List<Egyebek>();

    public virtual ICollection<Sajat> Sajats { get; } = new List<Sajat>();

    public virtual ICollection<Halmazertekek> Halmazertekeks { get; } = new List<Halmazertekek>();
    public virtual ICollection<Kere> Keres { get; } = new List<Kere>();

}
