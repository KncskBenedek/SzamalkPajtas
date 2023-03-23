using System;
using System.Collections.Generic;

namespace PajtasBackend.Models;

public partial class Egyebek
{
    public int Felhaszn { get; set; }

    public long Kerdes { get; set; }

    public bool SajatValasz { get; set; }

    public bool VartValasz { get; set; }

    public short Pont { get; set; }

    public virtual Felhasznalo FelhasznNavigation { get; set; } = null!;

    public virtual Kerde KerdesNavigation { get; set; } = null!;
}
