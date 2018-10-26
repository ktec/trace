defmodule Trace do
  @moduledoc """
  Documentation for Trace.

  ## Examples
    iex> {:ok, pid} = Trace.Tracer.start_link()
    ...> Trace.start_trace(pid)
    ...> Trace.Example.do_something()

  """

  def start_trace(pid, tracer) do
    # :erlang.trace(self(), true, [:all, {:tracer, pid}])

    # result = :erlang.trace_pattern(pattern, match_options, global_options)

    # :erlang.trace_pattern({Trace.Example, :_, :_}, [{:_, [], [{:return_trace}]}], [:local])
    # :erlang.trace_pattern({Trace.Uploader, :_, :_}, [{:_, [], [{:return_trace}]}], [:local])

    patterns = [
      # {:_, :_, :_}
      # {Trace.Example, :_, :_},
      {Trace.Uploader, :_, :_}
    ]

    match_options = [
      # Trace everything
      [{:_, [], [{:return_trace}]}]

      # true
    ]

    for pattern <- patterns, match_option <- match_options do
      :erlang.trace_pattern(pattern, match_option, [:local, :meta, :call_count, :call_time])
    end

    # pid = :processes
    # :erlang.trace(:processes, false, [:call, :monotonic_timestamp])
    # :erlang.trace(pid, true, [:call, tracer: tracer])
    :erlang.trace(pid, true, [:call, :monotonic_timestamp, tracer: tracer])
  end

  def stop_trace do
    :erlang.trace(self(), false, [:all])
  end
end
