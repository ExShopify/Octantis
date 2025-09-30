defmodule OctantisWeb.Components.PolarisWC.SQueryContainer do
  @moduledoc """
  Use to define an element as a containment context, enabling child components or styles to adapt based on the container’s size.
  """

  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  s_attr :container_name, :string,
    doc: ~S"""
    The name of the container, which can be used in your container queries to target this container specifically.

    We place the container name of s-default on every container. Because of this, it is not required to add a containerName identifier in your queries. For example, a @container (inline-size <= 300px) none, auto query is equivalent to @container s-default (inline-size <= 300px) none, auto.

    Any value set in containerName will be set alongside alongside s-default. For example, containerName="my-container-name" will result in a value of s-default my-container-name set on the container-name CSS property of the rendered HTML.
    """

  attr :rest, :global

  def s_query_container(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-query-container {@s_attrs} {@rest}>{render_slot(@inner_block)}</s-query-container>
    """
  end
end
