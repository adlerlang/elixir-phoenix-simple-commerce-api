defmodule ShiptMa.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :status, :string
      add :order_id, :string
      add :upc, :integer
      add :customer_id, references(:customers, on_delete: :nothing)
      timestamps()
    end

    #create index(:orders, [:customer_id])
  end
end
