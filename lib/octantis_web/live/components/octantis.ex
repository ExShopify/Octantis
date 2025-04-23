defmodule OctantisWeb.Components.Octantis do
  @moduledoc """
  Interactions with components.

  Components that use OctantisInteractable can have events pushed back to them with

  ```elixir
  {:noreply, Octantis.push_events(socket, %{"data-oct-open", "MyModalId"})}
  ```
  """

  @doc """
  Push an event to a component that uses the OctantisInteractable hook.
  """
  def push_events(socket, params) do
    params
    |> Enum.map(fn {key, id} -> {String.replace(key, "_", "-"), id} end)
    |> Enum.filter(&match?({"data-oct-" <> _, _}, &1))
    |> Enum.map(fn {key, id} -> {key, "octantis:interactable_#{id}"} end)
    |> Enum.reduce(socket, fn {key, event}, acc ->
      Phoenix.LiveView.push_event(acc, event, %{"key" => key})
    end)
  end
end
