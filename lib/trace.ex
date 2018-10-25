defmodule Trace do
  @moduledoc """
  Documentation for Trace.
  """

  @doc """
  Hello world.

  ## Examples

      iex> {:ok, pid} = Tracer.start_link()
      ...> Trace.start(pid)
      ...> Trace.hello

  """
  def hello do
    :timer.sleep(1000)
    :world
  end

  def start(pid) do
    :erlang.trace(self(), true, [:all, {:tracer, pid}])
  end

  def stop do
    :erlang.trace(self(), false, [:all])
  end
end
