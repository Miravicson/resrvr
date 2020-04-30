defmodule Rsvp.Utils do
  def string_to_date(date) do
    {:ok,  date, _} = DateTime.from_iso8601(date)
    date
  end
end