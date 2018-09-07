 defmodule ShiptMaWeb.PageController do
  use ShiptMaWeb, :controller
  import Ecto.Query , #only: [from: 2]
   alias ShiptMa.{Repo, Customer, Order, Product}

      
   def index(conn, _params) do
    
     query =  Repo.all(from c in "customers",
       join:  o in "orders",
       group_by: [:customer_id, :customer_fname, :customer_lname
		 ],
       select: %{id: c.customer_id,
                fname: c.customer_fname,
		lname: c.customer_lname,
               
       })
      
       
    
      render conn, "index.html", query: query
     
   end


   def order(conn, %{"id"=>id} ) do

     c = Customer |> Repo.get(id) |> Repo.preload(orders: :products)
     #IO.inspect c.orders
     #orders = for o <- c.orders, do:  %{order_id: o.order_id, status: o.status}
           orders = for o <- c.orders do
               for p <- o.products do
	         %{c: o.customer_id, time: o.inserted_at.day,  products: p.name, price: p.price, month: o.inserted_at.month, weight: p.weight, quantities: p.quantities, newdate: p.order_date.day, newweek: p.order_date.week }
       
	      end
	      end
       json conn, %{orders: orders}

  end



   def orders(conn, %{"day"=>day, "month"=> month, "year"=>year} ) do
    # products = Repo.all(from p in "products", select: p.inserted_at)




     
     products =  Repo.all(from p in Product, select: [p.id, p.order_date,  p.inserted_at]) 


     
    
     json conn, %{products: products}
    
   end


   def tl(conn, %{"id"=>id}) do
   # V = Postgrex.query{p
  json conn, %{1=>1}
   end

   
    
end
