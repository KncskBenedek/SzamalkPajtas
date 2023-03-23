using System;
using System.Collections.Generic;

namespace PajtasBackend.Models;

public partial class Kere
{
    public int Felhaszn { get; set; }

    public short Tulajd { get; set; }

    public short Sorsz { get; set; }

    public virtual Felhasznalo FelhasznNavigation { get; set; } = null!;
    public virtual Halmazertekek Halmazertekek { get; set; } = null!;

}
