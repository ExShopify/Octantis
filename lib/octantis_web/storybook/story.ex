defmodule OctantisWeb.Storybook.Story do
  @moduledoc """
  Create Storybook stories with the Polaris style sheet loaded in.

  ```elixir
  use OctantisWeb.Storybook.Story, :component
  ```
  """

  def component do
    quote do
      use PhoenixStorybook.Story, :component

      def imports, do: [{OctantisWeb.Components.Head, stylesheet: 1}]

      def template do
        """
        <.stylesheet psb-code-hidden/>
        <.psb-variation-group/>
        """
      end

      defoverridable imports: 0, template: 0
    end
  end

  @doc """
  Convenience helper for using the functions above.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
