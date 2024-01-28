using System;
using System.Collections.Generic;

namespace Backend.Models;

public partial class Storage
{
    public int Id { get; set; }

    public int Existing { get; set; }

    public int Sold { get; set; }
}
