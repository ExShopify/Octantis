defmodule OctantisWeb.Core do
  @moduledoc """
  Core Functionality for Polaris Components.

  """
  use Phoenix.Component

  defmacro __using__(_opts) do
    quote do
      use Phoenix.Component

      # HTML escaping functionality
      import Phoenix.HTML

      # Shortcut for generating JS commands
      alias Phoenix.LiveView.JS

      require unquote(__MODULE__)
      import unquote(__MODULE__)

      @breakpoints [:xs, :sm, :md, :lg, :xl]
      @module_name __MODULE__ |> Module.split() |> List.last() |> to_string
      @class_prefix "Polaris-" <> @module_name
      @exclass "Octantis-" <> @module_name
      @style_prefix "--pc-" <> (@module_name |> Macro.underscore() |> String.replace("_", "-"))

      defp to_style(attr_name, value, format \\ &Function.identity/1)

      defp to_style(attr_name, value, format) when is_nil(value), do: []

      defp to_style(attr_name, {breakpoint, value}, format)
           when is_nil(value) and breakpoint in @breakpoints,
           do: []

      defp to_style(attr_name, value, format)
           when is_binary(value) or is_number(value) or is_atom(value),
           do: [
             "#{@style_prefix}-#{strike_through(attr_name)}:#{value |> to_string() |> format.()}"
           ]

      defp to_style(attr_name, values, format) when is_list(values),
        do: Enum.flat_map(values, &to_style(attr_name, &1, format))

      defp to_style(attr_name, {breakpoint, value}, format)
           when (is_binary(value) or is_number(value) or is_atom(value)) and
                  breakpoint in @breakpoints do
        [
          "#{@style_prefix}-#{strike_through(attr_name)}-#{breakpoint}:#{value |> to_string() |> format.()}"
        ]
      end

      defp to_style(attr_name, {breakpoint, value}, format)
           when is_list(value) and breakpoint in @breakpoints do
        [
          "#{@style_prefix}-#{strike_through(attr_name)}-#{breakpoint}:#{value |> format.()}"
        ]
      end

      defp to_responsive_style(attr_name, value, format \\ &Function.identity/1)

      defp to_responsive_style(attr_name, value, format) when is_binary(value),
        do: to_style(attr_name, [xs: value], format)

      defp to_responsive_style(attr_name, values, format) when is_list(values),
        do: to_style(attr_name, values, format)

      defp to_responsive_style(attr_name, {breakpoint, value}, format) when is_binary(value),
        do: to_style(attr_name, [{breakpoint, value}], format)

      defp require_style(attr_name, default_value, attrs, build)
           when is_map(attrs) and is_atom(attr_name) and is_function(build, 2) do
        if Map.has_key?(attrs, attr_name) do
          []
        else
          build.({attr_name, default_value}, attrs)
        end
      end

      defp to_class(attr_name) when is_atom(attr_name), do: to_class(camel_case(attr_name))
      defp to_class(value), do: ["#{@class_prefix}--#{value}"]

      defp strike_through(key), do: key |> Atom.to_string() |> String.replace("_", "-")

      defp camel_case(key) do
        [first | rest] = key |> Atom.to_string() |> Macro.camelize() |> String.graphemes()
        String.downcase(first) <> Enum.join(rest)
      end
    end
  end

  defmacro import_polaris_components(components) do
    components
    |> List.wrap()
    |> Enum.map(fn component when is_atom(component) ->
      module =
        Module.concat([
          OctantisWeb.Components.Polaris,
          component |> Atom.to_string() |> Macro.camelize()
        ])

      quote do
        import unquote(module), only: [{unquote(component), 1}]
      end
    end)
  end

  def assign_default_nil(assigns, key) when is_atom(key), do: assign_default_nil(assigns, [key])

  def assign_default_nil(assigns, keys) when is_list(keys),
    do: Enum.reduce(keys, assigns, fn key, assigns -> assign_new(assigns, key, fn -> nil end) end)

  @doc """
  Optionally wrap the inner_block in a div.

  This is primarily to address the react pattern:

  ```react
  return descriptionMarkup ? (
      <div>
        {labelMarkup}
        {descriptionMarkup}
      </div>
    ) : (
      {labelMarkup}
    );
  ```

  which can now be rendered with

  ```heex
  <.div_wrapper wrap={@description}>
    {@label}
    {@description}
  </.div_wrapper>
  ```
  """
  attr :wrap, :boolean, default: true, doc: "Render the div, or just have the inner block"

  attr :rest, :global

  slot :inner_block

  def div_wrapper(assigns) do
    ~H"""
    <div :if={@wrap} {@rest}>
      {render_slot(@inner_block)}
    </div>
    {if !@wrap, do: render_slot(@inner_block)}
    """
  end

  @doc """
  Transform `phx_` prefixed assigns to both `data-phx-` and `phx-` assigns.

  This allows us use `bindingPrefix: "data-phx-"` in production as required by Shopify's AppBridge (See AppBridge section of the README)
    but also use the default `bindingPrefix: "phx-"` for tests and Storybook.

  `phx_values` is a special case that is expanded to `phx-value-key` and `data-phx-value-key`

  This should only be used html tags, and not on heex components.

  ## See

  https://hexdocs.pm/phoenix_live_view/bindings.html

  ## Examples

    iex> assigns |> assign_phx_bindings(%{phx_click={&click}, phx_values={[key: "value"]}})
    %{
      phx-click={&click}
      data-phx-click={&click}
      phx-value-key="value"
      data-phx-value-key="value"
    }

    heex> <button {@bindings} />
    <button
      phx-click={&click}
      data-phx-click={&click}
      phx-value-key="value"
      data-phx-value-key="value"
    />
  """

  @phx_bindings [
    :phx_values,
    :phx_click,
    :phx_click_away,
    :phx_change,
    :phx_submit,
    :phx_feedback_for,
    :phx_feedback_group,
    :phx_disable_with,
    :phx_trigger_action,
    :phx_auto_recover,
    :phx_blur,
    :phx_focus,
    :phx_window_blur,
    :phx_window_focus,
    :phx_keydown,
    :phx_keyup,
    :phx_window_keydown,
    :phx_window_keyup,
    :phx_key,
    :phx_viewport_top,
    :phx_viewport_bottom,
    :phx_mounted,
    :phx_update,
    :phx_remove,
    :phx_hook,
    :phx_connected,
    :phx_disconnected,
    :phx_debounce,
    :phx_throttle,
    :phx_track_static
  ]
  def assign_phx_bindings(assigns, binding_keys \\ @phx_bindings),
    do: assigns |> assign(:bindings, phx_bindings(assigns, binding_keys))

  def phx_bindings(assigns, binding_keys \\ @phx_bindings),
    do: assigns |> Map.take(binding_keys) |> Enum.flat_map(&transform_phx_binding/1) |> Map.new()

  defp transform_phx_binding({:phx_values, phx_values}) when not is_nil(phx_values) do
    Enum.flat_map(phx_values, fn {key, value} ->
      key = Atom.to_string(key)
      [{"phx-value-" <> key, value}, {"data-phx-value-" <> key, value}]
    end)
  end

  defp transform_phx_binding({key, value}) when not is_nil(value),
    do: [{phx_binding_key(key), value}, {data_phx_binding_key(key), value}]

  defp transform_phx_binding({_key, nil}), do: []

  defp phx_binding_key(key), do: key |> phx_binding_key_string() |> String.to_atom()
  defp data_phx_binding_key(key), do: key |> data_phx_binding_key_string() |> String.to_atom()

  defp phx_binding_key_string("phx_" <> key), do: ("phx_" <> key) |> String.replace("_", "-")

  defp phx_binding_key_string(key), do: key |> Atom.to_string() |> String.replace("_", "-")
  defp data_phx_binding_key_string(key), do: "data-" <> phx_binding_key_string(key)

  @extra_styles [
    :display,
    :margin,
    :max_height,
    :min_height,
    :object_fit,
    :flex_grow,
    :justify_content,
    :grid_auto_rows,
    :grid_template_columns,
    :grid_template_rows,
    :align_items,
    :align_self
  ]

  @doc """
  Assign common styles based on attributes. Use with the attr_extra_styles macro.

  ## Examples

    heex> <.block_stack flex_grow="1"/>
    <div style="flex-grow:1;"/>
  """
  def extra_styles(existing_styles \\ "", attrs) when is_map(attrs) do
    extra_styles = attrs |> Enum.flat_map(&build_extra_styles/1) |> Enum.join(";")
    existing_styles <> ";" <> extra_styles
  end

  defp build_extra_styles({:style, value}), do: [value]
  defp build_extra_styles({:display, value}), do: ["display:#{value}"]
  defp build_extra_styles({:margin, value}), do: ["margin:#{value}"]
  defp build_extra_styles({:max_height, value}), do: ["max-height:#{value}"]
  defp build_extra_styles({:min_height, value}), do: ["min-height:#{value}"]
  defp build_extra_styles({:object_fit, value}), do: ["object-fit:#{value}"]
  defp build_extra_styles({:position, value}), do: ["position:#{value}"]
  defp build_extra_styles({:flex_grow, value}), do: ["flex-grow:#{value}"]
  defp build_extra_styles({:justify_content, value}), do: ["justify-content:#{value}"]
  defp build_extra_styles({:grid_auto_rows, value}), do: ["grid-auto-rows:#{value}"]
  defp build_extra_styles({:grid_template_columns, value}), do: ["grid-template-columns:#{value}"]
  defp build_extra_styles({:grid_template_rows, value}), do: ["grid-template-rows:#{value}"]
  defp build_extra_styles({:align_items, value}), do: ["align-items:#{value}"]
  defp build_extra_styles({:align_self, value}), do: ["align-self:#{value}"]
  defp build_extra_styles({_key, _value}), do: []

  def assign_extra_styles(assigns),
    do: assign(assigns, :extra_styles, Map.take(assigns, @extra_styles))

  defmacro attr_extra_styles(opts \\ []) do
    only = Keyword.get(opts, :only, :all)
    except = Keyword.get(opts, :except, [])

    [:style | @extra_styles]
    |> Enum.filter(&(only == :all or &1 in only))
    |> Enum.reject(&(&1 in except))
    |> Enum.map(fn attr ->
      quote do
        attr unquote(attr), :string, doc: "Style attribute"
      end
    end)
  end

  @doc """
   Convenient syntax for sending slot attributes to a slot

  ## Examples
    heex> <.block_stack {slot_attributes(@myslot)} />
  """
  def slot_attributes(slots) when is_list(slots), do: List.first(slots) || []
  def slot_attributes(slots) when is_map(slots), do: slots

  defmacro assign_style(assigns) do
    quote do
      unquote(assigns) |> assign(:style, style(unquote(assigns)))
    end
  end

  defguardp is_slot_elem(slot)
            when is_map_key(slot, :__slot__) and is_atom(slot.__slot__)

  defguard is_slot(slot)
           when is_slot_elem(slot) or
                  (is_list(slot) and length(slot) > 0 and slot |> hd() |> is_slot_elem())

  @doc """
  Renders `slot` with render_slot if it is a slot.
  Otherwise it renders the inner_block.
  Allows for React like child or attribute pattern found repeatedly in Polaris.

  ## Examples
    heex>
      <.slot_wrapper slot={@title}>
        <.text variant="headingSm" as="h2">
          <%= @title %>
        </.text>
      </.slot_wrapper>

  """
  attr :rest, :global, include: ~w(slot)

  slot :slot

  slot :inner_block, doc: "The block to render if `slot` is not not a slot."

  def slot_wrapper(%{slot: %{__slot__: _}} = assigns), do: ~H"{render_slot(@slot)}"
  def slot_wrapper(%{slot: [%{__slot__: _} | _]} = assigns), do: ~H"{render_slot(@slot)}"
  def slot_wrapper(%{slot: func} = assigns) when is_function(func), do: ~H"{@slot.(assigns)}"
  def slot_wrapper(assigns), do: ~H"{render_slot(@inner_block)}"

  def translate_error({msg, _opts}), do: msg

  def translate_errors(field) when is_struct(field, Phoenix.HTML.FormField) do
    case length(field.errors) do
      len when len > 0 -> Enum.map(field.errors, &translate_error/1)
      0 -> nil
    end
  end

  def translate_errors(nil), do: nil

  @doc """
  Build the class in the magic way that matches polaris classes

  ## Examples
    iex> class_for_attribute("Polaris-Badge", :tone, "success")
    "Polaris-Badge--toneSuccess"

    iex> class_for_attribute("Polaris-Badge", :tone, "success--strong")
    "Polaris-Badge__toneSuccess--strong"
  """

  def class_for_attribute(prefix, attribute, value) when is_binary(value) do
    case String.split(value, "-") do
      [value] ->
        ["#{prefix}--#{attribute}#{Macro.camelize(value)}"]

      [value | rest] ->
        ["#{prefix}__#{attribute}#{Enum.join([Macro.camelize(value), rest], "--")}"]
    end
  end

  def class_for_attribute(_prefix, _attribute, nil), do: []
end
