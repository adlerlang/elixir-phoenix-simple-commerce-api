alias ShiptMa.{Repo,Customer,Order, Product}






product = [%{name: "shoe", upc: 1,  desc: "size 15 shoe", price: 4.33, weight: 32.0, quanties: 3},
          %{name: "pizza", upc: 2 ,  desc: "size 15 shoe", price: 8.00, weight: 3.0, quanties: 3}]

product2 =  [%{name: "donuts", upc: 3,  desc: "size 15 shoe", price: 9.33, weight: 2.0, quanties: 8}]


order1 = [%{order_id: "3", upc: 1,  customer_id: "2", status: "delivered"},
	  %{order_id: "2",  upc: 2  ,customer_id: "5", status: "delivered",
	    products: product

	  }]


customer1 = %{customer_id: "1",  customer_fname: "mike", customer_lname: "adler", customer_address: "3233 n 54 terr, Fort Lauderdale, Florida", customer_phone: "954-434-3232", orders: order1}

order2 = [%{order_id: "3",  customer_id: "14", status: "delivered", upc: 3}]

customer2 =  %{customer_id: "2",  customer_fname: "alex", customer_lname: "nobody", customer_address: "3233 n 54 terr, Fort Lauderdale, Florida\
", customer_phone: "954-434-3232", orders: order2}




#--- Use MULTI!!!----


# Repo.insert! Customer.changeset(%Customer{}, customer1)
  Repo.insert! Customer.changeset(%Customer{}, customer1)
 # Repo.insert! Product.changeset(%Product{}, product)







