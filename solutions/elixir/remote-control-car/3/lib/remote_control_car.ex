defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct battery_percentage: 100,
            distance_driven_in_meters: 0,
            nickname: nil
            
  def new(nickname \\ "none"), do: %RemoteControlCar{nickname: nickname}

  def display_distance(%RemoteControlCar{distance_driven_in_meters: d}), do: "#{d} meters"

  def display_battery(%RemoteControlCar{battery_percentage: batt}) when batt == 0, do: "Battery empty"
  def display_battery(%RemoteControlCar{battery_percentage: batt}), do: "Battery at #{batt}%"

  def drive(%RemoteControlCar{battery_percentage: batt} = car) when batt == 0, do: car
  def drive(%RemoteControlCar{} = car), do: %{car | battery_percentage: car.battery_percentage - 1, distance_driven_in_meters: car.distance_driven_in_meters + 20}
end
