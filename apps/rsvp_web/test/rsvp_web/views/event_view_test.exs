defmodule RsvpWeb.EventViewTest do
  use RsvpWeb.ConnCase, async: true

  @tag current: true
  test "Should convert a date to YYYY/MM/Day format" do
    date = elem(DateTime.from_iso8601("2014-09-28T16:00:00Z"), 1)
    formatted = RsvpWeb.EventView.format_date(date)
    assert formatted == "2014/9/28"
  end

  @tag current: true
  test "Should convert a datetime object to the format HH:MM:SS" do
    date =  elem(DateTime.from_iso8601("2014-09-28T16:00:00Z"), 1)
    formatted = RsvpWeb.EventView.format_time(date)
    assert formatted == "16:00:00"
  end
end