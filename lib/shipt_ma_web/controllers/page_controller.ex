defmodule ShiptMaWeb.PageController do
  use ShiptMaWeb, :controller
  import Ecto.Query
   alias ShiptMa.{Repo}


   def index(conn, _params) do
     query =  Repo.all(from c in "customers",
     
       join:  o in "orders", where: o.customer_id == c.id,
       group_by: [c.customer_id,c.customer_fname, c.customer_lname, o.upc],
       select: %{id: c.customer_id,
                fname: c.customer_fname,
		lname: c.customer_lname,
                 upc: o.upc
      }

      
        )     
      json conn, query
      #,query: query
  end

  def inventory(conn, _params) do
    a = %{"one" => 1}

    json conn, a
    
   end
  
end
