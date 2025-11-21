defmodule OctantisWeb.Components.PolarisWC.SOrderedList do
  @moduledoc """
  Displays a numbered list of related items in a specific sequence. Use to present step-by-step instructions, ranked items, or procedures where order matters.

  ```elixir
  <.s_ordered_list>
    <:s_list_item>Red shirt</:s_list_item>
    <:s_list_item>Green shirt</:s_list_item>
    <:s_list_item>Blue shirt</:s_list_item>
  </.s_ordered_list>
  ```

  See
  - http://shopify.dev/docs/api/app-home/polaris-web-components/structure/orderedlist

  """

  use OctantisWeb.Core, :web_component

  import OctantisWeb.Components.PolarisWC.SListItem

  @doc @moduledoc

  attr :rest, :global

  slot :s_list_item,
    doc: """
          Represents a single item within an unordered or ordered list. Use only as a child of `s-unordered-list` or `s-ordered-list` components.
    """

  def s_ordered_list(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-ordered-list {@s_attrs} {@rest}>
      <.s_list_item :for={item <- @s_list_item} {item}>
        {render_slot(item)}
      </.s_list_item>
    </s-ordered-list>
    """
  end
end
