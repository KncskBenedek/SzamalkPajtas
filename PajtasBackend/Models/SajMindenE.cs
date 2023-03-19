﻿using System;
using System.Collections.Generic;

namespace PajtasBackend.Models;

public partial class SajMindenE
{
    public int FhAzon { get; set; }

    public string Nev { get; set; } = null!;

    public short Tulajd { get; set; }

    public string? Jelentés { get; set; }

    public short Sorsz { get; set; }

    public string Ertek { get; set; } = null!;
}
