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


   def orders(conn, %{"id"=>id} ) do

     c = Customer |> Repo.get(id) |> Repo.preload(orders: :products)
   
           orders = for o <- c.orders do
               for p <- o.products do
	         %{customer_id: o.customer_id, time: o.inserted_at.day,  products: p.name, price: p.price, weight: p.weight, quantities: p.quantities, ordered_date: p.order_date}
       
	      end
	      end
       json conn, %{orders: orders}

  end



   def sales_range(conn, %{"start_date" => start_date, "end_date" => end_date} ) do

     
     {start_d, end_d} =
       try do
	 {NaiveDateTime.from_iso8601!(start_date  <> " 00:00:00"),
	  NaiveDateTime.from_iso8601!(end_date <> " 00:00:00") }     
       rescue
       _-> json conn, %{error: "resort to README for proper urls "}
       end


     
     
     products =  Repo.all(from p in Product, select: %{id: p.order_id, product: p.name, quantities: p.quantities, p: p.inserted_at}, where: p.inserted_at >= ^start_d and p.inserted_at <= ^end_d  )
 
   IO.inspect products

     
     json conn, %{products: products}
     
  


   end
  


   
   
    
end
