defmodule ShiptMa.Product do
  use Ecto.Schema
  import Ecto.Changeset


   schema "products" do
    field :name, :string
    field :desc, :string
    field :price, :float
    field :weight, :float
    field :quanties, :integer
    field :order_id, :id
 #    belongs_to :order, ShiptMa.Order
    timestamps()
  end

  
  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [ :name, :desc, :order_id,:price, :weight, :quanties])
    |> validate_required([:name])
    
  end
end
