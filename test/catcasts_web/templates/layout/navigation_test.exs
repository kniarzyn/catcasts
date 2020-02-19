defmodule CatcastsWeb.NavigationTest do
  use CatcastsWeb.ConnCase

  test "shows a sign in with Google link when not signed in", %{conn: conn} do
    conn = get(conn, "/")

    assert html_response(conn, 200) =~ "Sign in with Google"
  end

  test "shows a Sign out link when signed in", %{conn: conn} do
    user = user_fixture()

    conn =
      conn
      |> assign(:user, user)
      |> get("/")

    assert html_response(conn, 200) =~ "Sign out"
  end
end
