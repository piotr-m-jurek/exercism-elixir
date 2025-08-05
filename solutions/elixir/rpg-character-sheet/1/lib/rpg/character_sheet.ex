defmodule RPG.CharacterSheet do
  def welcome(), do: IO.puts("Welcome! Let's fill out your character sheet together.")
  def ask_name(), do: String.trim(IO.gets("What is your character's name?\n"))
  def ask_class(), do: String.trim(IO.gets("What is your character's class?\n"))
  def ask_level(), do:  String.trim(IO.gets("What is your character's level?\n")) |> String.to_integer()
  def run() do    
    welcome()
    name_  =  ask_name()
    class_ =  ask_class()
    level_ =  ask_level()
    your_character = %{class: class_, level: level_, name: name_}
    
    IO.inspect(your_character,label: "Your character")

  end
end