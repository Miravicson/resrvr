defmodule Rsvp.Repo do
  use Ecto.Repo,
    otp_app: :rsvp,
    adapter: Ecto.Adapters.Postgres
end