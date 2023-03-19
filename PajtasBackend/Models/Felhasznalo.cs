using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace PajtasBackend.Models;

public partial class Felhasznalo
{
    public int FhAzon { get; set; }

    public string Nev { get; set; } = null!;

    public string? Email { get; set; }

    public string Jelszo { get; set; } = null!;

    [JsonIgnore]
    public virtual ICollection<Egyebek> Egyebeks { get; } = new List<Egyebek>();
    [JsonIgnore]

    public virtual ICollection<Sajat> Sajats { get; } = new List<Sajat>();
    [JsonIgnore]

    public virtual ICollection<Halmazertekek> Halmazertekeks { get; } = new List<Halmazertekek>();
}
