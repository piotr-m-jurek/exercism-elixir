defmodule RPNCalculator do
  def calculate!(stack, operation) do
    operation.(stack)
  end

  def calculate(stack, operation) do
    try do
      value = operation.(stack)
      {:ok, value}
    rescue 
      _ -> :error
    end
  end
  

  def calculate_verbose(stack, operation) do
    try do
      value = operation.(stack)
      {:ok, value}
    rescue 
      e in ArgumentError -> {:error, e.message}
    end
  end
end
