defmodule Trace.Example do
  @moduledoc false

  alias Trace.Uploader

  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def init(args) do
    {:ok, args}
  end

  def do_something(pid) when is_pid(pid) do
    GenServer.call(pid, :do_something)
  end

  def handle_call(:do_something, _from, state) do
    Trace.Uploader.upload(1)
    Trace.Uploader.upload(2)
    Trace.Uploader.upload(3)
    {:reply, :ok, state}
  end
end
