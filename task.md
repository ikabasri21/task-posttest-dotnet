```cs

public class Customer
{
    public int id { get; set; }
    public string name { get; set; }
}

public class Item
{
    public int id { get; set; }
    public string name { get; set; }
    public int qty { get; set; }
    public int price { get; set; }
}

public class Order
{
    public string order_id { get; set; }
    public DateTime created_at { get; set; }
    public Customer customer { get; set; }
    public List<Item> items { get; set; }
}


var orders = new List<Order>
        {
            {
                new Order()
                {
                    order_id = "SO-921",
                    created_at = DateTime.Parse("2018-02-17T03:24:12"),
                    customer = new Customer() { id = 33, name = "Ari" },
                    items = new List<Item>{
                        {new Item() { id = 24, name = "Sapu Lidi", qty = 2, price = 13200 }},
                        {new Item() { id = 73, name = "Sprei 160x200 polos", qty = 1, price = 149000 }},
                    },
                }
            },

            {
                new Order()
                {
                    order_id = "SO-922",
                    created_at = DateTime.Parse("2018-02-20T13:10:32"),
                    customer = new Customer()  {id = 40, name = "Ririn" },
                    items = new List<Item>
                    {
                        { new Item() { id = 83, name = "Rice Cooker", qty = 1, price = 258000 }},
                        { new Item() { id = 24, name = "Sapu Lidi", qty = 1, price = 13200 }},
                        { new Item() { id = 30, name = "Teflon", qty = 1, price = 190000 }},
                    }
                }
            },

            {
                new Order()
                {
                    order_id = "SO-926",
                    created_at = DateTime.Parse("2018-03-05T16:23:20"),
                    customer = new Customer()  {id = 58, name = "Annis"},
                    items = new List<Item>
                        {
                            new Item() { id = 24, name = "Sapu Lidi", qty = 3, price = 13200 }
                        }
                }
            },
            {
                new Order()
                {
                    order_id = "SO-925",
                    created_at = DateTime.Parse("2018-03-03T14:52:22"),
                    customer = new Customer()  {id = 33, name = "Ari"},
                    items = new List<Item>
                        {
                            { new Item() { id = 1033, name = "Nintendo Switch", qty = 1, price = 4990000 }},
                            { new Item() { id = 2003, name = "Macbook Air 11 inch 128 GB", qty = 1, price = 12000000 }},
                            { new Item() { id = 23, name = "Pocari Sweat 600ML", qty = 5, price = 7000 }},
                        },
                }

            }
        };
        
```

You need to do three things:

1) Find all purchases made in February.

2) Find all purchases made by Ari, and add **grand total** by sum all total price of items. The output should only a number.

3) Find people who have purchases with **grand total** lower than `300000`. The output is an array of people name. Duplicate name is not allowed.