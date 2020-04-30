defmodule RsvpWeb.EventView do
  use RsvpWeb, :view

  def format_date(date) do
    %{year: year, day: day, month: month} = date
    "#{year}/#{pad(month)}/#{pad(day)}"
  end

  def format_time(date) do
    %{hour: hour, minute: minute, second: second} = date;
    hour = pad(hour)
    minute = pad(minute)
    second = pad(second)
    "#{hour}:#{minute}:#{second}"
  end

  defp pad(string) do
    String.pad_leading(inspect(string), 2, "0")
  end
end
