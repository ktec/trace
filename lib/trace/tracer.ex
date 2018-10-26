defmodule Trace.Tracer do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def init(args) do
    {:ok, args}
  end

  # def handle_info({:trace, _pid, :call, message}, state) do
  #   IO.inspect(message, label: "Call")
  #   {:noreply, state}
  # end
  #
  # def handle_info({:trace, _pid, :return_from, message, from}, state) do
  #   IO.inspect({message, from}, label: "Return")
  #   {:noreply, state}
  # end

  def handle_info(message, state) do
    IO.inspect(message)
    {:noreply, state}
  end
end
