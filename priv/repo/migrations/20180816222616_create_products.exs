defmodule ShiptMa.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :desc, :string
      add :price, :float
      add :weight, :float
      add :quanties, :integer
      add :upc, references(:orders, on_delete: :nothing)
      timestamps()
    end

    create index(:products, [:upc])
  end
end
