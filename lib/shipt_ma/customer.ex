defmodule ShiptMa.Customer do
  use Ecto.Schema
  import Ecto.Changeset
  alias ShiptMa.Repo
  
  
  schema "customers" do
    field :customer_address, :string
    field :customer_fname, :string
    field :customer_id, :integer
    field :customer_lname, :string
    field :customer_phone, :string
    has_many :orders, ShiptMa.Order
    timestamps()
  end


  


  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:customer_id, :customer_fname, :customer_lname, :customer_address, :customer_phone])
    |> validate_required([:customer_id, :customer_fname, :customer_lname, :customer_address, :customer_phone])
    |> cast_assoc(:orders)
  end
end
