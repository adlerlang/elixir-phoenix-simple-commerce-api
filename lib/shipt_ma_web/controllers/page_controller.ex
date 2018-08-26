 defmodule ShiptMaWeb.PageController do
  use ShiptMaWeb, :controller
  import Ecto.Query #, only: [from: 2]
   alias ShiptMa.{Repo, Customer}


   def index(conn, _params) do
    
     query =  Repo.all(from c in "customers",
     
       join:  o in "orders",
       where: o.customer_id == o.customer_id,
       select: %{id: c.customer_id,
                fname: c.customer_fname,
		lname: c.customer_lname,
                 upc: o.order_id
      }
           
      
        )     
      render conn, "index.html", query: query
      #,query: query
   end


   def orders(conn, %{"id"=>id} ) do

     c = Customer |> Repo.get(id) |> Repo.preload(orders: :products)
    

     orders = for o <- c.orders, do:  %{order_id: o.order_id, status: o.status }

       
   json conn, orders

  end

  def inventory(conn, _params) do
    a = %{"one" => 1}

    json conn, a
    
   end
  
end
