defmodule ShiptMaWeb.PageView do
  use ShiptMaWeb, :view
  import Ecto.Query
  alias ShiptMa.{Repo, Customer}

  def toa do

    Repo.all(from u in "customers",
      where: u.id > 0,
      select: %{id: u.id}
    )
    #  Repo.all(Customer)

    
    
  end


    
  

  
end
