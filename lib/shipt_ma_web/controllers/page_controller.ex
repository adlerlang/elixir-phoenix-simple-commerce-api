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
	         %{customer_id: o.customer_id, time: o.inserted_at.day,  products: p.name, price: p.price, weight: p.weight, quantities: p.quantities}
       
	      end
	      end
       json conn, %{orders: orders}

  end
   
   

   def sales_range(conn, %{"start_date" => start_date, "end_date" => end_date}=params ) do
  {start_d, end_d} =
       try do
         {NaiveDateTime.from_iso8601!(start_date  <> " 00:00:00"),
          NaiveDateTime.from_iso8601!(end_date <> " 00:00:00") }
       rescue
       _-> json conn, %{error: "resort to README for proper urls "}
       end
	
        products_query =  Repo.all(from p in Product, select: %{name: p.name, description: p.desc, qty: sum(p.quantities), price: p.price},
	group_by: [p.name, p.quantities, p.desc, p.price],
	where: p.inserted_at >= ^start_d and p.inserted_at <= ^end_d)
          case params["csv"] do	
          "true"-> conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("content-disposition", "attachment; filename=\"Shipt_Sales.csv\"")
    |> send_resp(200, csv(products_query))
 
	   _->json conn, %{products: products_query}
          end
  


   end

   

 defp csv(data) do
     data
     |> CSV.encode(headers: [:name, :description, :price, :qty])
     |> Enum.to_list
     |> to_string
  end
end
