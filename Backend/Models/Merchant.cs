using System;
using System.Collections.Generic;

namespace Backend.Models;

public partial class Merchant
{
    public int Id { get; set; }

    public string SerialName { get; set; } = null!;

    public string Type { get; set; } = null!;

    public int Price { get; set; }

    public int QuantityId { get; set; }

    public virtual Quantity Quantity { get; set; } = null!;

    public virtual ICollection<User> Users { get; set; } = new List<User>();
}
