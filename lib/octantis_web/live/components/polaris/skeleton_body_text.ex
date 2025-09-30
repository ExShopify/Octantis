defmodule OctantisWeb.Components.Polaris.SkeletonBodyText do
  @moduledoc """
  Skeleton display text is used to provide a low fidelity representation of content before it appears on the page, and improves load times perceived by merchants. Can be used for content in or outside of a card.

  ## Examples
  ```elixir
  </.skeleton_body_text>
  ```

  ## See
    - https://polaris.shopify.com/components/feedback-indicators/skeleton-body-text
    - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/SkeletonBodyText/SkeletonBodyText.tsx
  """

  use OctantisWeb.Core

  @doc @moduledoc

  attr :lines, :integer, default: 3

  attr_extra_styles()

  attr :rest, :global

  def skeleton_body_text(assigns) do
    assigns =
      assigns
      |> assign(:style, extra_styles(assigns))

    ~H"""
    <div class="Polaris-SkeletonBodyText__SkeletonBodyTextContainer" } style={@style} {@rest}>
      <div :for={i <- 1..@lines} class="Polaris-SkeletonBodyText" key={i}></div>
    </div>
    """
  end
end
