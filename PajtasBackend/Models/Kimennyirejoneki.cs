using System;
using System.Collections.Generic;

namespace PajtasBackend.Models;

public partial class Kimennyirejoneki
{
    public int Kinek { get; set; }

    public int? Felhaszn { get; set; }

    public float? Ennyire { get; set; }
}
