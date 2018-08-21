defmodule ShiptMa.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :customer_id, :string
      add :customer_fname, :string
      add :customer_lname, :string
      add :customer_address, :string
      add :customer_phone, :string

      timestamps()
    end
    # create unique_index(:customers, [:customer_id])

  end
end
