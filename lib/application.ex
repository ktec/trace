defmodule Trace.Application do
  use Application

  def start(_type, _args) do
    children = []
    opts = [strategy: :one_for_one, name: Trace]

    alias Trace.{Tracer, Example}

    {:ok, tracer_pid} = Tracer.start_link()
    {:ok, example_pid} = Example.start_link()

    Trace.start_trace(example_pid, tracer_pid)

    # Trace this!!
    Example.do_something(example_pid)

    Supervisor.start_link(children, opts)
  end
end
