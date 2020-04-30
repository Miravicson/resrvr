load_data = fn ->
  Rsvp.EventQueries.create(Rsvp.Events.changeset(%Rsvp.Events{}, %{
  title: "Holiday Resort",
  location: "Lagos",
  description: "Have an amazing day",
  date: "2021-04-01 06:00:00"
}))
Rsvp.EventQueries.create(Rsvp.Events.changeset(%Rsvp.Events{}, %{
  title: "African Bar",
  location: "Lagos",
  description: "Exotic wildlife and recreation",
  date: "2021-04-01 06:00:00"
}))
end



cond do
  Rsvp.EventQueries.any() -> IO.puts("Data already loaded into db")
  true -> load_data.()
end

