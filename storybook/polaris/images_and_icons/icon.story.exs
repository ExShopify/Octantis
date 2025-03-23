defmodule Storybook.Polaris.Icon do
  use PhoenixStorybook.Story, :component

  alias OctantisWeb.Components.Polaris.Icon
  alias OctantisWeb.Components.Polaris.Icons

  def function, do: &OctantisWeb.Components.Polaris.Icon.icon/1

  def aliases, do: [OctantisWeb.Components.Polaris.Icons]

  def variations do
    Icons.__info__(:functions)
    |> Enum.filter(fn {_icon_name, arity} -> arity == 1 end)
    |> Enum.map(fn {icon_name, _arity} ->
      %VariationGroup{
        id: icon_name,
        variations:
          Icon.tone_values()
          |> Enum.map(fn tone ->
            %Variation{
              id: String.to_atom(tone),
              slots: [
                ~s|<Icons.#{icon_name} />|
              ],
              attributes: %{tone: tone}
            }
          end)
      }
    end)
  end
end
