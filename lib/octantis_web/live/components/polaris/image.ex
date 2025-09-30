defmodule OctantisWeb.Components.Polaris.Image do
  @moduledoc """
  Just an image.

  ## Examples
  ```elixir
  <.image source="/images/relax.svg" alt="Nothing here yet"/>
  ``` 

  ## See
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Image/Image.tsx
  """

  use OctantisWeb.Core

  @doc @moduledoc

  attr :alt, :string, default: nil
  attr :source, :string, required: true
  # attr :cross_origin: cross_origin
  # attr :source_set?: SourceSet[];
  # attr :onLoad?(): void;
  # attr :onError?(): void;

  attr_extra_styles()

  attr :rest, :global

  def image(assigns) do
    assigns = assigns |> assign(:style, extra_styles(assigns))

    ~H"""
    <img alt={@alt} src={@source} style={@style} {@rest} />
    """
  end
end
