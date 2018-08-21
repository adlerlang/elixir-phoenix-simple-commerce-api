defmodule ShiptMa.Product do
  use Ecto.Schema
  import Ecto.Changeset


   schema "products" do
    field :name, :string
    field :upc, :id
    field :desc, :string
    field :price, :float
    field :weight, :float
    field :quanties, :integer
    timestamps()
  end

  
  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :upc, :desc, :price, :weight, :quanties])
    |> validate_required([:name])

  end
end
