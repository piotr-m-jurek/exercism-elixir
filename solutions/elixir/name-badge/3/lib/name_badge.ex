defmodule NameBadge do
  def print(id, name, department) do
    id = if(id == nil, do: "", else: "[#{id}] - ")
    department = if(department == nil, do: "OWNER", else: department |> String.upcase())
    "#{id}#{name} - #{department}"
  end
  
end
