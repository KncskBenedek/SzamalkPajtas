using System;
using System.Collections.Generic;

namespace PajtasBackend.Models;

public partial class Egymasnakmennyire
{
    public int Egyik { get; set; }

    public int? Másik { get; set; }

    public float? Oda { get; set; }

    public float? Vissza { get; set; }

    public double? Egymáshoz { get; set; }
}
