defmodule OctantisWeb.Components.PolarisWC.SUnorderedList do
  @moduledoc """
  Displays a bulleted list of related items. Use to present collections of items or options where the sequence isn’t critical.

  ## Example

  ```elixir
    <.s_unordered_list>
      <:s_list_item>Red shirt</:s_list_item>
      <:s_list_item>Green shirt</:s_list_item>
      <:s_list_item>Blue shirt</:s_list_item>
    </.s_unordered_list>
    ```

  ## See

  - https://shopify.dev/docs/api/app-home/polaris-web-components/structure/unorderedlist
  """

  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  slot :s_list_item,
    doc: """
    The items of the UnorderedList.
    """

  attr :rest, :global, include: ~w(slot)

  def s_unordered_list(assigns) do
    ~H"""
    <s-unordered-list {@rest}>
      <s-list-item :for={list_item <- @s_list_item}>
        {render_slot(list_item)}
      </s-list-item>
    </s-unordered-list>
    """
  end
end
