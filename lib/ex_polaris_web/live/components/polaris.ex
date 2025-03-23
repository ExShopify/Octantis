defmodule ExPolarisWeb.Components.Polaris do
  @moduledoc """
  Polaris Components
  These components are an implementation of the Shopify Polaris design system.
  Style attributes are taken from Polaris Tokens. https://polaris.shopify.com/tokens/color
  See https://polaris.shopify.com/components
  """

  use Phoenix.Component

  defdelegate box(assigns), to: ExPolarisWeb.Components.Polaris.Box
  defdelegate text(assigns), to: ExPolarisWeb.Components.Polaris.Text
end
