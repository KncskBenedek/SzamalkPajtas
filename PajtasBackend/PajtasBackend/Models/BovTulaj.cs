using System;
using System.Collections.Generic;

namespace PajtasBackend.Models;

public partial class BovTulaj
{
    public short Tulajd { get; set; }

    public string? Jelentés { get; set; }

    public int? Also { get; set; }

    public int? Felso { get; set; }

    public bool? Halmaz { get; set; }

    public virtual ICollection<Halmazertekek> Halmazertekeks { get; } = new List<Halmazertekek>();
}
