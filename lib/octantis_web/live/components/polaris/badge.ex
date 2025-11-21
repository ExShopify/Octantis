defmodule OctantisWeb.Components.Polaris.Badge do
  @moduledoc """
  Cards are used to group similar concepts and tasks together for merchants to scan, read, and get things done. It displays content in a familiar and recognizable style.

  ## Examples
  ```elixir
  <.badge>
    <:icon><Icons.plus_circle /></:icon>
  </.badge>
  ```

  ## See
    - https://polaris.shopify.com/components/feedback-indicators/badge
    - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Badge/Badge.tsx
  """
  use OctantisWeb.Core, :component

  import_polaris_components([:icon, :text])

  @doc @moduledoc

  attr :accessibility_label, :string

  attr :tone, :string,
    values: [
      "info",
      "success",
      "warning",
      "critical",
      "attention",
      "new",
      "magic",
      "info-strong",
      "success-strong",
      "warning-strong",
      "critical-strong",
      "attention-strong",
      "read-only",
      "enabled"
    ]

  attr :size, :string, values: ["small", "medium", "large"]

  attr :progress, :string, values: ["incomplete", "partiallyComplete", "complete"]

  slot :icon

  slot :inner_block

  attr :rest, :global

  def badge(assigns) do
    assigns =
      assigns
      |> assign(:class, badge_build_class(assigns))
      |> assign_new(:accessibility_label, fn -> nil end)
      |> assign_new(:progress, fn -> nil end)
      |> assign_new(:tone, fn -> nil end)

    ~H"""
    <span class={["Polaris-Badge", @class]} {@rest}>
      <.text :if={@accessibility_label} as="span" visually_hidden>
        {@accessibility_label}
      </.text>

      <.progress_icon :if={@progress} icon={@progress} />
      <span :if={@icon != []} class="Polaris-Badge__Icon">
        <.icon>{render_slot(@icon)}</.icon>
      </span>

      <.text
        :if={@inner_block}
        as="span"
        variant="bodySm"
        font_weight={if @tone == "new", do: "medium"}
      >
        {render_slot(@inner_block)}
      </.text>
    </span>
    """
  end

  def badge_build_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&badge_class/1) |> Enum.join(" ")

  def badge_class({:tone, value}), do: class_for_attribute(@class_prefix, :tone, value)
  def badge_class({:size, "large"}), do: ["Polaris-Badge--sizeLarge"]
  def badge_class({_key, _value}), do: []

  def progress_icon(%{icon: "incomplete"} = assigns) do
    ~H"""
    <span class="Polaris-Badge__Icon">
      <.icon>
        <svg viewBox="0 0 20 20">
          <path
            fillRule="evenodd"
            d="M8.547 12.69c.183.05.443.06 1.453.06s1.27-.01 1.453-.06a1.75 1.75 0 0 0 1.237-1.237c.05-.182.06-.443.06-1.453s-.01-1.27-.06-1.453a1.75 1.75 0 0 0-1.237-1.237c-.182-.05-.443-.06-1.453-.06s-1.27.01-1.453.06A1.75 1.75 0 0 0 7.31 8.547c-.05.183-.06.443-.06 1.453s.01 1.27.06 1.453a1.75 1.75 0 0 0 1.237 1.237ZM6.102 8.224C6 8.605 6 9.07 6 10s0 1.395.102 1.777a3 3 0 0 0 2.122 2.12C8.605 14 9.07 14 10 14s1.395 0 1.777-.102a3 3 0 0 0 2.12-2.121C14 11.395 14 10.93 14 10c0-.93 0-1.395-.102-1.776a3 3 0 0 0-2.121-2.122C11.395 6 10.93 6 10 6c-.93 0-1.395 0-1.776.102a3 3 0 0 0-2.122 2.122Z"
          />
        </svg>
      </.icon>
    </span>
    """
  end

  def progress_icon(%{icon: "partiallyComplete"} = assigns) do
    ~H"""
    <span class="Polaris-Badge__Icon">
      <.icon>
        <svg viewBox="0 0 20 20">
          <path
            fillRule="evenodd"
            d="m8.888 6.014-.017-.018-.02.02c-.253.013-.45.038-.628.086a3 3 0 0 0-2.12 2.122C6 8.605 6 9.07 6 10s0 1.395.102 1.777a3 3 0 0 0 2.121 2.12C8.605 14 9.07 14 10 14c.93 0 1.395 0 1.776-.102a3 3 0 0 0 2.122-2.121C14 11.395 14 10.93 14 10c0-.93 0-1.395-.102-1.776a3 3 0 0 0-2.122-2.122C11.395 6 10.93 6 10 6c-.475 0-.829 0-1.112.014ZM8.446 7.34a1.75 1.75 0 0 0-1.041.94l4.314 4.315c.443-.2.786-.576.941-1.042L8.446 7.34Zm4.304 2.536L10.124 7.25c.908.001 1.154.013 1.329.06a1.75 1.75 0 0 1 1.237 1.237c.047.175.059.42.06 1.329ZM8.547 12.69c.182.05.442.06 1.453.06h.106L7.25 9.894V10c0 1.01.01 1.27.06 1.453a1.75 1.75 0 0 0 1.237 1.237Z"
          />
        </svg>
      </.icon>
    </span>
    """
  end

  def progress_icon(%{icon: "complete"} = assigns) do
    ~H"""
    <span class="Polaris-Badge__Icon">
      <.icon>
        <svg viewBox="0 0 20 20">
          <path d="M6 10c0-.93 0-1.395.102-1.776a3 3 0 0 1 2.121-2.122C8.605 6 9.07 6 10 6c.93 0 1.395 0 1.776.102a3 3 0 0 1 2.122 2.122C14 8.605 14 9.07 14 10s0 1.395-.102 1.777a3 3 0 0 1-2.122 2.12C11.395 14 10.93 14 10 14s-1.395 0-1.777-.102a3 3 0 0 1-2.12-2.121C6 11.395 6 10.93 6 10Z" />
        </svg>
      </.icon>
    </span>
    """
  end
end
