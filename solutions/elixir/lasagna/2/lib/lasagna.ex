defmodule Lasagna do
  def expected_minutes_in_oven() do
    40
  end
  
  def remaining_minutes_in_oven(actual_mins) do
    expected_minutes_in_oven() - actual_mins
  end
  
  def preparation_time_in_minutes(layers) do
    layers * 2
  end
  
  def total_time_in_minutes(layers, passed_minutes) do
    passed_minutes + preparation_time_in_minutes(layers)
  end
  
  def alarm() do
  "Ding!"
  end
  
end
