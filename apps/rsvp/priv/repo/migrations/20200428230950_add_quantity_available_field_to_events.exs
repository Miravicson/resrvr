defmodule Rsvp.Repo.Migrations.AddQuantityAvailableFieldToEvents do
  use Ecto.Migration

  def change do
    alter table("events") do
      add :quantity_available, :integer, default: 25
    end
  end
end
