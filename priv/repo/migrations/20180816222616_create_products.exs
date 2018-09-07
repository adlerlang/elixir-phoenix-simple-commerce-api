defmodule ShiptMa.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :upc, :string
      add :name, :string
      add :desc, :string
      add :price, :float
      add :weight, :float
      add :quantities, :integer
      add :order_date, :date
      add :order_id, references(:orders, on_delete: :nothing)
      timestamps()
    end

   # create index(:products, [:order_id])
  end
end
