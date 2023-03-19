using System;
using System.Collections.Generic;

namespace PajtasBackend.Models;

public partial class MindenegyebF
{
    public int FhAzon { get; set; }

    public string Nev { get; set; } = null!;

    public string? Email { get; set; }

    public string Jelszo { get; set; } = null!;

    public long Kod { get; set; }

    public string Szoveg { get; set; } = null!;

    public bool SajatValasz { get; set; }

    public bool VartValasz { get; set; }

    public short Pont { get; set; }
}
