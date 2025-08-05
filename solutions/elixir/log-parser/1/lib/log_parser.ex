defmodule LogParser do
  def valid_line?(line) do
    line =~ ~r/^\[(DEBUG|INFO|WARNING|ERROR)\] .*/
  end

  def split_line(line) do
    Regex.split(~r/\<(~|\*|-|\=)*\>/, line)
  end

  def remove_artifacts(line) do
    String.replace(line, ~r/end-of-line(\d){1,}/i,"", global: true)
  end

  def tag_with_user_name(line) do
    case Regex.run(~r/User\s+([^\s]+)/, line) do
      nil -> line
      [_, name] -> "[USER] #{name} #{line}"
    end
  end
end
