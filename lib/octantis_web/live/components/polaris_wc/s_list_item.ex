defmodule OctantisWeb.Components.PolarisWC.SListItem do
  @moduledoc """
  Represents a single item within an unordered or ordered list. Use only as a child of `s-unordered-list` or `s-ordered-list` components.

  Used with `s_ordered_list`
  """

  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  attr :rest, :global

  slot :inner_block

  def s_list_item(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-list-item {@s_attrs} {@rest}>{render_slot(@inner_block)}</s-list-item>
    """
  end
end
