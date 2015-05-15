defmodule Summit360Www.PageControllerTest do
  use Summit360Www.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
