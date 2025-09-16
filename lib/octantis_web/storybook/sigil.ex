defmodule OctantisWeb.Storybook.Sigil do
  @moduledoc """
  We cannot pass in `requires` to Storybook, so we do not have access to sigils.

  In order to use the `~o` sigil, we instead have a hacky bypass.
  """

  require OctantisWeb.Components.PolarisWC.Types
  import OctantisWeb.Components.PolarisWC.Types

  def sigil_o(expression, modifiers) do
    code = ~s|~o(#{expression})#{modifiers}|
    {result, _binding} = Code.eval_string(code, [], __ENV__)

    result
  end

  def remove_import_warning, do: colours()
end
