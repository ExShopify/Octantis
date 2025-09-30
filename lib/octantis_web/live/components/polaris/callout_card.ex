defmodule OctantisWeb.Components.Polaris.CalloutCard do
  @moduledoc """
  Callout cards are used to encourage merchants to take an action related to a new feature or opportunity. They are most commonly displayed in the sales channels section of Shopify.

  ## Examples
  ```elixir
  <.callout_card title="Customize the style of your checkout" illustration="https://cdn.shopify.com/s/assets/admin/checkout/settings-customizecart-705f57c725ac05be5a34ec20c05b94298cb8afd10aac7bd9c7ad02030f48cfa0.svg">
    <p>Upload your store’s logo, change colors and fonts, and more.</p>
    <:primary_action content="Customize checkout" url="#" />
  </.callout_card>
  ```

  ## See
   - https://polaris.shopify.com/components/layout-and-structure/callout-card
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/CalloutCard/CalloutCard.tsx

  ## Expanded CSS

  To size the Callout Card body to align the buttons to the bottom:

  ```
  .Octantis-CalloutCard.Polaris-Box{
    height:100%;
    .Polaris-CalloutCard__Container{
      height:100%;
      .Polaris-LegacyCard__Section{
        height:100%;
        .Polaris-CalloutCard{
          height:100%;
          .Polaris-CalloutCard__Content{
            height:100%;
            display: flex;
            flex-direction: column;
            .Polaris-CalloutCard__Body{
              flex-grow: 1;
            }
          }
        }
      }
    }
  }
  ```

  """
  use OctantisWeb.Core, :component

  require OctantisWeb.Components.Polaris.ComplexAction

  import_polaris_components([:block_stack, :button_group, :card, :image, :text])

  alias OctantisWeb.Components.Polaris.ComplexAction

  @doc @moduledoc

  attr :title, :string, doc: "The title of the card"

  attr :illustration, :string, doc: "URL to the card illustration"

  slot :primary_action,
    validate_attrs: true,
    doc: "Primary action for the card" do
    ComplexAction.attributes()
  end

  slot :secondary_action,
    validate_attrs: true,
    doc: "Secondary action for the card" do
    ComplexAction.attributes()
  end

  def callout_card(assigns) do
    assigns =
      assigns
      |> assign_new(:title, fn -> nil end)
      |> assign_new(:illustration, fn -> nil end)

    ~H"""
    <.card padding={[xs: "0"]} class="Octantis-CalloutCard">
      <div class="Polaris-CalloutCard__Container">
        <div class="Polaris-LegacyCard__Section Polaris-LegacyCard__FirstSectionPadding Polaris-LegacyCard__LastSectionPadding">
          <div class="Polaris-CalloutCard">
            <div class="Polaris-CalloutCard__Content">
              <div :if={@title} class="Polaris-CalloutCard__Title">
                <.text variant="headingSm" as="h2">
                  {@title}
                </.text>
              </div>
              <div class="Polaris-CalloutCard__Body">
                <.text as="span" variant="bodyMd">
                  <.block_stack>{render_slot(@inner_block)}</.block_stack>
                </.text>
              </div>
              <div class="Polaris-CalloutCard__Buttons">
                <.button_group>
                  <:complex_action :for={action <- @primary_action} {action} />
                  <:complex_action :for={action <- @secondary_action} variant="tertiary" {action} />
                </.button_group>
              </div>
            </div>
            <.image
              :if={@illustration}
              alt=""
              class="Polaris-CalloutCard__Image"
              source={@illustration}
            />
          </div>
        </div>
      </div>
    </.card>
    """
  end
end
