defmodule OctantisWeb.Core.WebComponent do
  @moduledoc """
  Core Functionality for Polaris Web Components.

  """
  use Phoenix.Component

  @binding_prefix Application.compile_env(:octantis, :binding_prefix, "data-phx-")

  alias OctantisWeb.Components.PolarisWC.Types

  alias Phoenix.LiveView.JS

  def assign_attrs_from_map(assigns, key, attributes) do
    keys =
      attributes
      |> Enum.reject(&event?/1)
      |> Keyword.keys()

    attrs =
      assigns
      |> Map.take(keys)
      |> Map.new(fn {key, value} ->
        {attribute_name, s_type} = attributes[key]
        {attribute_name, format_attr(value, key, s_type)}
      end)

    assigns |> assign(key, attrs)
  end

  def assign_events_from_map(assigns, key, attributes) do
    keys = attributes |> Enum.filter(&event?/1) |> Keyword.keys()

    events =
      attributes
      |> Enum.filter(&event?/1)
      |> Enum.map_join(",", fn {name, {_attribute_name, _s_type}} -> name end)

    attrs =
      assigns
      |> Map.take(keys)
      |> Map.new(fn {key, value} ->
        {attribute_name, s_type} = attributes[key]
        {"data-octantis-" <> attribute_name, format_attr(value, key, s_type)}
      end)
      |> Map.put("data-octantis-proxy-events", events)
      |> Map.put(@binding_prefix <> "hook", "OctantisEventProxy")

    assigns |> assign(key, attrs)
  end

  def format_attr(value, _key, :event) when is_binary(value), do: JS.push(value)
  def format_attr(%JS{} = value, _key, :event), do: value
  def format_attr(value, _key, _type) when is_binary(value), do: value
  def format_attr(value, _key, :size_units), do: value
  def format_attr(value, _key, :size_units_or_auto), do: value
  def format_attr(value, _key, :size_units_or_none), do: value

  def format_attr({:responsive, value}, key, {:responsive, type}),
    do: "@container #{format_attr(value, key, type)}"

  def format_attr({:responsive, value}, key, {:responsive, name, type}),
    do: "@container #{name} #{format_attr(value, key, type)}"

  def format_attr({operator, compare, expr1, expr2}, _key, _keyword),
    do: "(inline-size #{operator} #{compare}) #{expr1}, #{expr2}"

  def format_attr(value, _key, :string), do: value
  def format_attr(value, _key, _keyword), do: value

  defmacro s_attr(name, s_type, opts \\ []) do
    s_type = Macro.expand_literals(s_type, %{__CALLER__ | function: {:attr, 3}})
    opts = Macro.expand_literals(opts, %{__CALLER__ | function: {:attr, 3}})

    type = Types.get_base_type(s_type)
    opts = Types.put_options(type, opts)
    attribute_name = Types.attribute_name(name)

    quote bind_quoted: [
            name: name,
            type: type,
            opts: opts,
            s_type: s_type,
            attribute_name: attribute_name
          ] do
      @s_attrs {name, {attribute_name, s_type}}

      attr(name, type, opts)
    end
  end

  def assign_field_values(%{field: field} = assigns) do
    field_values = %{
      name: field.name,
      value: field.value,
      error: translate_errors(field)
    }

    assigns
    |> assign(:field_values, field_values)
  end

  def translate_error({msg, _opts}), do: msg

  def translate_errors(field) when is_struct(field, Phoenix.HTML.FormField) do
    case length(field.errors) do
      len when len > 0 -> Enum.map(field.errors, &translate_error/1)
      0 -> nil
    end
  end

  def translate_errors(nil), do: nil

  defp event?({_name, {_attribute_name, :event}}), do: true
  defp event?({_name, {_attribute_name, _s_type}}), do: false
end
