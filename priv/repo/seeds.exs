alias ShiptMa.{Repo,Customer,Order, Product}




product = [%{upc: "1-23432-43453-74343-0", order_id: 1, name: "ice cream",  desc: "pint of ice cream", price: 4.33, weight: 32.1, quantities: 1, order_date: Ecto.Date.from_erl({2015,4,1})},
           %{upc: "1-21542-34345-26534-3" ,order_id: 1, name: "pizza" , desc: "cheese pizza", price: 8.00, weight: 3.5, quantities: 4, order_date: Ecto.Date.from_erl({2015,4,1})}
	  ]

product2 = [%{upc: "6-45443-00000-79073-1", order_id: 2, name: "oranges",  desc: "pound of oranges", price: 5.00, weight: 32.1, quantities: 3,  order_date: Ecto.Date.from_erl({2018,6,3})},
             %{upc: "8-98792-00345-22334-1" ,order_id: 2, name: "apples" , desc: "pound of apples", price: 8.00, weight: 3.5, quantities: 1,  order_date: Ecto.Date.from_erl({2018,6,3})}
           ]

products3 = [ %{upc: "9-98792-00745-27634-0" ,order_id: 3, name: "chicken" , desc: "roasted chicken", price: 10.00, weight: 1, quantities: 1,  order_date: Ecto.Date.from_erl({2018,6,14})}]


order1 = [%{order_id: 1,  customer_id: 1, status: "delivered", products: product},
	  %{order_id: 2,   customer_id: 1, status: "delivered",  products: product2}
	 ]

order2 = [%{order_id: 3, customer_id: "2", status: "in transit", products: products3}]


customer1 = %{customer_id: 1,  customer_fname: "will", customer_lname: "who", customer_address: "3233 n 54 terr, Fort Lauderdale, Florida", customer_phone: "954-434-3232", orders: order1}

customer2 = %{customer_id: 2, customer_fname: "sarah", customer_lname: "me", customer_address: "3434 s 43 s, Orlando, Florida", customer_phone: "854-645-3434", orders: order2 }


customers = [customer1, customer2]

  for c <- customers do
  Repo.insert! Customer.changeset(%Customer{}, c )
  end







