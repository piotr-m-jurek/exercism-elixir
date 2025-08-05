defmodule Newsletter do
  @spec read_emails(Path.t()) :: list(String.t())
  def read_emails(path) do
    case File.read(path) do
      {:ok, contents} ->
        contents
        |> to_string()
        |> (fn c -> String.split(c, "\n") end).()
        |> (fn c -> Enum.filter(c, &(&1 != "")) end).()

      {:error, _reason} ->
        []
    end
  end

  def open_log(path) do
    File.open!(path, [:write])
  end

  def log_sent_email(pid, email) do
    IO.puts(pid, email)
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    emails = read_emails(emails_path)
    pid = open_log(log_path)

    Enum.each(
      emails,
      fn email ->
        case send_fun.(email) do
          :ok -> log_sent_email(pid, email)
          _ -> nil
        end
      end
    )

    close_log(pid)
  end
end
