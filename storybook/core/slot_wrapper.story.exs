defmodule Storybook.Core.SlotWrapper do
  use OctantisWeb.Storybook.Story, :component

  alias OctantisWeb.Components.Polaris.Icons

  def imports do
    [
      {OctantisWeb.Components.Polaris.Card, card: 1},
      {OctantisWeb.Components.Head, stylesheet: 1}
    ]
  end

  def function, do: &OctantisWeb.Core.slot_wrapper/1

  def variations do
    [
      %VariationGroup{
        id: :no_slots,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|<.card>This is shown</.card>|]
          }
        ]
      },
      %VariationGroup{
        id: :multiple_slits,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<.card background="bg-fill-critical">This is not shown</.card>|,
              ~s|<:slot :for={text <- ~w(This is shown)} ><.card>{text}</.card></:slot>|
            ]
          }
        ]
      },
      %VariationGroup{
        id: :empty_slots,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<.card>This is shown</.card>|,
              ~s|<:slot :for={text <- []} ><.card>{text}</.card></:slot>|
            ]
          }
        ]
      },
      %VariationGroup{
        id: :slot_function,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<.card background="bg-fill-critical">This is not shown</.card>|
            ],
            attributes: %{
              slot: &Icons.check_circle/1
            }
          }
        ]
      }
    ]
  end
end
