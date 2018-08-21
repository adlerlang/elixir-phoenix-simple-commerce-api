defmodule ShiptMa.Order do
  use Ecto.Schema
  import Ecto.Changeset


  schema "orders" do
    field :order_id, :string
    field :status, :string
    field :customer_id, :id
    field :upc, :integer
    has_many :products, ShiptMa.Product
    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:order_id, :status ])
    |> validate_required([  :status])
    |> cast_assoc(:products)
  end
end
