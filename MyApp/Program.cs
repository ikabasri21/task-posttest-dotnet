using System.Text.Json;

public class Customer
{
    public int id { get; set; }
    public string? name { get; set; }
}

public class Item
{
    public int id { get; set; }
    public string? name { get; set; }
    public int qty { get; set; }
    public int price { get; set; }
}

public class Order
{
    public string? order_id { get; set; }
    public DateTime created_at { get; set; }
    public Customer? customer { get; set; }
    public List<Item>? items { get; set; }
}

public class orderData{
    public static void Main()
    {
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

// 1) Find all purchases made in February.
        var options = new JsonSerializerOptions { WriteIndented = true };
        string puchaseInFebruary = JsonSerializer.Serialize(orders.Where(puchaseInFebruary => puchaseInFebruary.created_at.Month == 02), options);

        Console.WriteLine("1. Number of Orders in February= " + puchaseInFebruary);


// 2) Find all purchases made by Ari, and add **grand total** by sum all total price of items. The output should only a number.

        var orderByAri = orders.Where(item => item?.customer?.name == "Ari");
        var options3 = new JsonSerializerOptions { WriteIndented = true };
        var price = orderByAri.Select(item => item?.items?.Select(item => item.price));
        var qty = orderByAri.Select(item => item?.items?.Select(item => item.qty));

        string priceOfItem = JsonSerializer.Serialize(price, options);
        string qtyOfItem = JsonSerializer.Serialize(qty, options);

        Console.WriteLine("List of Prices of Item Ordered by Ari = " + priceOfItem);
        Console.WriteLine("List of Quantity of Item Ordered by Ari = " + qtyOfItem);


        List<int> totalOfPuchase = new List<int>();

        for(int i = 0; i < price.Count(); i++)
        {
            for(int j = 0; j < price.ElementAt(i).Count(); j++)
            {
                int total = price.ElementAt(i).ElementAt(j) * qty.ElementAt(i).ElementAt(j);
                totalOfPuchase.Add(total);
            }
        }

        string totalPriceOfItem = JsonSerializer.Serialize(totalOfPuchase.Sum(), options);
        Console.WriteLine("2. Total purchases made by Ari = " + totalPriceOfItem);

// 3) Find people who have purchases with **grand total** lower than `300000`. The output is an array of people name. Duplicate name is not allowed.
string[] names = { "Annis", "Ari", "Ririn" };
    foreach (string name in names)
        {
            var customerName = orders.Where(item => item.customer.name == name);
            var priceP = customerName.Select(item => item.items.Select(item => item.price));
            var qtyP = customerName.Select(item => item.items.Select(item => item.qty));

            List<int> totalPriceOfItemP = new List<int>();

            for (int i = 0; i < priceP.Count(); i++)
            {
                for (int j = 0; j < priceP.ElementAt(i).Count(); j++)
                {
                    int total =
                        priceP.ElementAt(i).ElementAt(j) * qtyP.ElementAt(i).ElementAt(j);
                    totalPriceOfItemP.Add(total);
                }
            }

        var grandTotal = totalPriceOfItemP.Sum();
        var purchassUnder300K = grandTotal < 300000;

        if (purchassUnder300K == true)
        {
            Console.WriteLine($"3. people who have purchases with **grand total** lower than `300000` is {name} with purchase Rp {grandTotal}");
        }
        
        }
    }
}
