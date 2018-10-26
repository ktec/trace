defmodule Trace.Uploader do
  @moduledoc """
  Example upload handler
  """

  @doc """
  Pretend to upload.
  """
  def upload(counter) do
    :timer.sleep(1000)
    IO.inspect(counter)
    :upload_complete
  end
end
