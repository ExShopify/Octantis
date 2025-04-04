defmodule OctantisWeb.Components.Polaris.InlineError do
  @moduledoc """
  Inline errors are brief, in-context messages that tell merchants something went wrong with a single or group of inputs in a form. Use inline errors to help merchants understand why a form input may not be valid and how to fix it.

  ## Examples
    ```elixir
    </.inline_error message="Store name is required" field_id="myFieldID" >
    ```

  See
   - https://polaris.shopify.com/components/selection-and-input/inline-error
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/InlineError/InlineError.tsx
  """

  use Phoenix.Component

  import OctantisWeb.Components.Polaris.Icon
  import OctantisWeb.Components.Polaris.Text

  alias OctantisWeb.Components.Polaris.Icons

  @doc @moduledoc

  attr :message, :string,
    required: true,
    doc: "Content briefly explaining how to resolve the invalid form field input."

  attr :field_id, :string,
    doc: "Unique identifier of the invalid form field that the message describes."

  def inline_error(assigns) do
    id = if assigns.field_id, do: assigns.field_id <> "Error", else: nil

    assigns = assigns |> assign_new(:id, fn -> id end)

    ~H"""
    <div class="Polaris-InlineError" id={@id}>
      <div class="Polaris-InlineError__Icon">
        <.icon><Icons.alert_circle /></.icon>
      </div>
      <.text as="span" variant="bodyMd">
        {@message}
      </.text>
    </div>
    """
  end
end
