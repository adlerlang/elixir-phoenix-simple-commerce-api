alias ShiptMa.{Repo,Customer,Order, Product}




product = [%{order_id: "1", name: "shoe",  desc: "size 15 shoe", price: 4.33, weight: 32.0, quanties: 3},
          %{order_id: "1", name: "pizza" , desc: "cheese pizza", price: 8.00, weight: 3.0, quanties: 3}]


order1 = [%{order_id: "1",  customer_id: "1", status: "delivered"},
	  %{order_id: "1",   customer_id: "1", status: "delivered",
	    products: product

	  }]


customer1 = %{customer_id: "1",  customer_fname: "mike", customer_lname: "adler", customer_address: "3233 n 54 terr, Fort Lauderdale, Florida", customer_phone: "954-434-3232", orders: order1}


  Repo.insert! Customer.changeset(%Customer{}, customer1)








