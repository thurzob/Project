using System;
using System.Collections.Generic;

namespace Backend.Models;

public partial class Quantity
{
    public int Id { get; set; }

    public int QuantityPurchased { get; set; }

    public virtual ICollection<Merchant> Merchants { get; set; } = new List<Merchant>();
}
