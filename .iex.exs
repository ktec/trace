alias Trace.{Tracer, Example}

{:ok, tracer_pid} = Tracer.start_link()
{:ok, example_pid} = Example.start_link()

Trace.start_trace(example_pid, tracer_pid)

# Trace this!!
Example.do_something(example_pid)
