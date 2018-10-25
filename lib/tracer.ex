defmodule Tracer do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def init(args) do
    {:ok, args}
  end

  def handle_info(message, state) do
    IO.inspect("GenServer says #{inspect(message)}")
    {:noreply, state}
  end
end
