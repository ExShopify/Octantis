defmodule OctantisWeb.Components.PolarisWC.SSpinner do
  @moduledoc """
  Displays an animated indicator showing users that content or actions are loading. Use to communicate ongoing processes, such as fetching data from a server. For loading states on buttons, use the “loading” property on the Button component instead.

  ## Example

  ```elixir
  <.s_spinner accessibility_label="Loading" size="large-100"></.s_spinner>
  ```

  ## See

  - https://shopify.dev/docs/api/app-home/polaris-web-components/feedback/spinner
  """
  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  ## Properties

  s_attr :accessibility_label, :string,
    doc: """
    A label that describes the purpose of the progress. When set, it will be announced to users using assistive technologies and will provide them with more context. Providing an `accessibilityLabel` is recommended if there is no accompanying text describing that something is loading.
    """

  s_attr :size,
    doc: """
      "base" | "large" | "large-100"
    """

  attr :rest, :global

  slot :inner_block

  def s_spinner(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-spinner {@s_attrs} {@rest}>{render_slot(@inner_block)}</s-spinner>
    """
  end
end
