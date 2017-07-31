defmodule PhDelay.DelayController do
  use PhDelay.Web, :controller
  require Logger

  def index(conn, _params) do
    t1 = DateTime.utc_now() |> DateTime.to_iso8601()
    Logger.debug "#{inspect t1} index start ..."

    :timer.sleep(60000)
    
    t2 = DateTime.utc_now() |> DateTime.to_iso8601()
    Logger.debug "#{inspect t2} index send"

    conn
    |> put_resp_header("content-type", "text/text; charset=UTF-8")
    |> send_resp(200, "some text")
  end
end
