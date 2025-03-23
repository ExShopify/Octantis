defmodule OctantisWeb.StorybookTest do
  use OctantisWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  describe "Stroybooks" do
    OctantisWeb.Storybook.content_tree()
    |> PhoenixStorybook.Entries.flat_list()
    |> Enum.map(&Map.from_struct/1)
    |> Enum.reject(fn entry -> entry[:open?] == false end)
    |> Enum.map(fn entry ->
      Map.put(
        entry,
        :full_name,
        entry.path |> Path.split() |> Enum.map_join(" ", &Macro.camelize/1)
      )
    end)
    |> Enum.map(fn entry ->
      test entry.full_name, %{conn: conn} do
        {:ok, view, _html} = live(conn, "/storybook" <> unquote(entry.path))

        assert view
               |> element("#live-container", unquote(entry.name))
               |> render_async() =~ unquote(entry.name)
      end
    end)
  end
end
