defmodule ShiptMa.Product do
  use Ecto.Schema
  import Ecto.Changeset

  
  schema "products" do
    field :upc,  :string
    field :name, :string
    field :desc, :string
    field :price, :float
    field :weight, :float
    field :quantities, :integer
    field :order_id, :id
    timestamps()
  end

  
  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:upc, :name, :desc, :order_id,:price, :weight, :quantities])
    |> validate_required([:name])
    
  end
end
