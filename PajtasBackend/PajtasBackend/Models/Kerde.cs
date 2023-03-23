using System;
using System.Collections.Generic;

namespace PajtasBackend.Models;

public partial class Kerde
{
    public long Kod { get; set; }

    public string Szoveg { get; set; } = null!;

    public virtual ICollection<Egyebek> Egyebeks { get; } = new List<Egyebek>();
}
