using System;
using System.Collections.Generic;

namespace PajtasBackend.Models;

public partial class Halmazertekek
{
    public short Tulajd { get; set; }

    public short Sorsz { get; set; }

    public string Ertek { get; set; } = null!;

    public virtual ICollection<Sajat> Sajats { get; } = new List<Sajat>();

    public virtual BovTulaj TulajdNavigation { get; set; } = null!;

    public virtual ICollection<Felhasznalo> Felhaszns { get; } = new List<Felhasznalo>();
}
