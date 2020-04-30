defmodule Rsvp.Repo.Migrations.AddDescriptionField do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :description, :string, size: 1000
    end
  end
end
