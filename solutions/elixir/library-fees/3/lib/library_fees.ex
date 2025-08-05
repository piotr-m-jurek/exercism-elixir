defmodule LibraryFees do
  @spec datetime_from_string(String.t()) :: NaiveDateTime
  def datetime_from_string(string) do
    case DateTime.from_iso8601(string) do
      {:ok, date, _offset} -> DateTime.to_naive(date)
      {:error, _atom} -> nil
    end
  end

  def before_noon?(datetime) do
    case Time.compare(~T[12:00:00], datetime |> NaiveDateTime.to_time()) do
      :gt -> true
      :lt -> false
      :eq -> false
    end
  end

  @spec return_date(NaiveDateTime) :: Date
  def return_date(checkout_datetime) do
    day = 24 * 60 * 60

    if(before_noon?(checkout_datetime),
      do: NaiveDateTime.add(checkout_datetime, 28 * day),
      else: NaiveDateTime.add(checkout_datetime, 29 * day)
    )
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    return_date = NaiveDateTime.to_date(actual_return_datetime)

    case Date.compare(
           return_date,
           planned_return_date
         ) do
      :gt -> Date.diff(return_date, planned_return_date)
      :lt -> 0
      :eq -> 0
    end
  end

  @spec monday?(NaiveDateTime) :: boolean()
  def monday?(datetime) do
    case datetime |> NaiveDateTime.to_date() |> Date.day_of_week() do
      1 -> true
      _ -> false
    end
  end

  def calculate_late_fee(checkout, return, rate) do
    planned_return_date = checkout |> datetime_from_string() |> return_date()
    actual_return_datetime = return |> datetime_from_string()
    late = days_late(planned_return_date, actual_return_datetime)
    discount = if(monday?(actual_return_datetime), do: 0.5, else: 1)

    (late * rate * discount) |> floor()
  end
end
