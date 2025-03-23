defmodule OctantisWeb.Components.Polaris.Icons do
  @moduledoc """
  Selected Polaris Icons. Used with PolarisComponents.Icon

  ## Examples
    ```elxiir
    <Icons.adjust />
    ```

  See
   - https://polaris.shopify.com/icons
  """

  use Phoenix.Component

  def adjust(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path
        fill-rule="evenodd"
        d="M9.095 6.25a3.001 3.001 0 0 1 5.81 0h1.345a.75.75 0 0 1 0 1.5h-1.345a3.001 3.001 0 0 1-5.81 0h-5.345a.75.75 0 0 1 0-1.5h5.345Zm1.405.75a1.5 1.5 0 1 1 3 0 1.5 1.5 0 0 1-3 0Z"
      />
      <path
        fill-rule="evenodd"
        d="M8 16a3.001 3.001 0 0 0 2.905-2.25h5.345a.75.75 0 0 0 0-1.5h-5.345a3.001 3.001 0 0 0-5.81 0h-1.345a.75.75 0 0 0 0 1.5h1.345a3.001 3.001 0 0 0 2.905 2.25Zm1.5-3a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0Z"
      />
    </svg>
    """
  end

  def alert_circle(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path d="M10 6a.75.75 0 0 1 .75.75v3.5a.75.75 0 0 1-1.5 0v-3.5a.75.75 0 0 1 .75-.75Z" /><path d="M11 13a1 1 0 1 1-2 0 1 1 0 0 1 2 0Z" /><path
        fill-rule="evenodd"
        d="M17 10a7 7 0 1 1-14 0 7 7 0 0 1 14 0Zm-1.5 0a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0Z"
      />
    </svg>
    """
  end

  def alert_diamond(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path d="M10 6a.75.75 0 0 1 .75.75v3.5a.75.75 0 0 1-1.5 0v-3.5a.75.75 0 0 1 .75-.75Z" /><path d="M11 13a1 1 0 1 1-2 0 1 1 0 0 1 2 0Z" /><path
        fill-rule="evenodd"
        d="M11.237 3.177a1.75 1.75 0 0 0-2.474 0l-5.586 5.585a1.75 1.75 0 0 0 0 2.475l5.586 5.586a1.75 1.75 0 0 0 2.474 0l5.586-5.586a1.75 1.75 0 0 0 0-2.475l-5.586-5.585Zm-1.414 1.06a.25.25 0 0 1 .354 0l5.586 5.586a.25.25 0 0 1 0 .354l-5.586 5.585a.25.25 0 0 1-.354 0l-5.586-5.585a.25.25 0 0 1 0-.354l5.586-5.586Z"
      />
    </svg>
    """
  end

  def alert_triangle(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path d="M10 6.75a.75.75 0 0 1 .75.75v3.5a.75.75 0 1 1-1.5 0v-3.5a.75.75 0 0 1 .75-.75Z" /><path d="M11 13.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0Z" /><path
        fill-rule="evenodd"
        d="M10 3.5c-1.045 0-1.784.702-2.152 1.447a449.26 449.26 0 0 1-2.005 3.847l-.028.052a403.426 403.426 0 0 0-2.008 3.856c-.372.752-.478 1.75.093 2.614.57.863 1.542 1.184 2.464 1.184h7.272c.922 0 1.895-.32 2.464-1.184.57-.864.465-1.862.093-2.614-.21-.424-1.113-2.147-2.004-3.847l-.032-.061a429.497 429.497 0 0 1-2.005-3.847c-.368-.745-1.107-1.447-2.152-1.447Zm-.808 2.112c.404-.816 1.212-.816 1.616 0 .202.409 1.112 2.145 2.022 3.88a418.904 418.904 0 0 1 2.018 3.875c.404.817 0 1.633-1.212 1.633h-7.272c-1.212 0-1.617-.816-1.212-1.633.202-.408 1.113-2.147 2.023-3.883a421.932 421.932 0 0 0 2.017-3.872Z"
      />
    </svg>
    """
  end

  def arrow_left(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path
        fill-rule="evenodd"
        d="M16.5 10a.75.75 0 0 1-.75.75h-9.69l2.72 2.72a.75.75 0 0 1-1.06 1.06l-4-4a.75.75 0 0 1 0-1.06l4-4a.75.75 0 1 1 1.06 1.06l-2.72 2.72h9.69a.75.75 0 0 1 .75.75Z"
      />
    </svg>
    """
  end

  def arrow_right(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path
        fill-rule="evenodd"
        d="M3.5 10a.75.75 0 0 1 .75-.75h9.69l-2.72-2.72a.75.75 0 1 1 1.06-1.06l4 4a.75.75 0 0 1 0 1.06l-4 4a.75.75 0 0 1-1.06-1.06l2.72-2.72h-9.69a.75.75 0 0 1-.75-.75Z"
      />
    </svg>
    """
  end

  def caret_down(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path
        fill-rule="evenodd"
        d="M6.24 8.2a.75.75 0 0 1 1.06.04l2.7 2.908 2.7-2.908a.75.75 0 1 1 1.1 1.02l-3.25 3.5a.75.75 0 0 1-1.1 0l-3.25-3.5a.75.75 0 0 1 .04-1.06Z"
      />
    </svg>
    """
  end

  def check(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path
        fill-rule="evenodd"
        d="M15.78 5.97a.75.75 0 0 1 0 1.06l-6.5 6.5a.75.75 0 0 1-1.06 0l-3.25-3.25a.75.75 0 1 1 1.06-1.06l2.72 2.72 5.97-5.97a.75.75 0 0 1 1.06 0Z"
      />
    </svg>
    """
  end

  def check_circle(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path d="M13.28 9.03a.75.75 0 0 0-1.06-1.06l-2.97 2.97-1.22-1.22a.75.75 0 0 0-1.06 1.06l1.75 1.75a.75.75 0 0 0 1.06 0l3.5-3.5Z" /><path
        fill-rule="evenodd"
        d="M17 10a7 7 0 1 1-14 0 7 7 0 0 1 14 0Zm-1.5 0a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0Z"
      />
    </svg>
    """
  end

  def chevron_down(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path
        fill-rule="evenodd"
        d="M5.72 8.47a.75.75 0 0 1 1.06 0l3.47 3.47 3.47-3.47a.75.75 0 1 1 1.06 1.06l-4 4a.75.75 0 0 1-1.06 0l-4-4a.75.75 0 0 1 0-1.06Z"
      />
    </svg>
    """
  end

  def chevron_left(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path
        fill-rule="evenodd"
        d="M11.764 5.204a.75.75 0 0 1 .032 1.06l-3.516 3.736 3.516 3.736a.75.75 0 1 1-1.092 1.028l-4-4.25a.75.75 0 0 1 0-1.028l4-4.25a.75.75 0 0 1 1.06-.032Z"
      />
    </svg>
    """
  end

  def chevron_right(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path
        fill-rule="evenodd"
        d="M7.72 14.53a.75.75 0 0 1 0-1.06l3.47-3.47-3.47-3.47a.75.75 0 0 1 1.06-1.06l4 4a.75.75 0 0 1 0 1.06l-4 4a.75.75 0 0 1-1.06 0Z"
      />
    </svg>
    """
  end

  def delete(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path d="M11.5 8.25a.75.75 0 0 1 .75.75v4.25a.75.75 0 0 1-1.5 0v-4.25a.75.75 0 0 1 .75-.75Z" /><path d="M9.25 9a.75.75 0 0 0-1.5 0v4.25a.75.75 0 0 0 1.5 0v-4.25Z" /><path
        fill-rule="evenodd"
        d="M7.25 5.25a2.75 2.75 0 0 1 5.5 0h3a.75.75 0 0 1 0 1.5h-.75v5.45c0 1.68 0 2.52-.327 3.162a3 3 0 0 1-1.311 1.311c-.642.327-1.482.327-3.162.327h-.4c-1.68 0-2.52 0-3.162-.327a3 3 0 0 1-1.311-1.311c-.327-.642-.327-1.482-.327-3.162v-5.45h-.75a.75.75 0 0 1 0-1.5h3Zm1.5 0a1.25 1.25 0 1 1 2.5 0h-2.5Zm-2.25 1.5h7v5.45c0 .865-.001 1.423-.036 1.848-.033.408-.09.559-.128.633a1.5 1.5 0 0 1-.655.655c-.074.038-.225.095-.633.128-.425.035-.983.036-1.848.036h-.4c-.865 0-1.423-.001-1.848-.036-.408-.033-.559-.09-.633-.128a1.5 1.5 0 0 1-.656-.655c-.037-.074-.094-.225-.127-.633-.035-.425-.036-.983-.036-1.848v-5.45Z"
      />
    </svg>
    """
  end

  def edit(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path
        fill-rule="evenodd"
        d="M15.655 4.344a2.695 2.695 0 0 0-3.81 0l-.599.599-.009-.009-1.06 1.06.008.01-5.88 5.88a2.75 2.75 0 0 0-.805 1.944v1.922a.75.75 0 0 0 .75.75h1.922a2.75 2.75 0 0 0 1.944-.806l7.54-7.539a2.695 2.695 0 0 0 0-3.81Zm-4.409 2.72-5.88 5.88a1.25 1.25 0 0 0-.366.884v1.172h1.172c.331 0 .65-.132.883-.366l5.88-5.88-1.689-1.69Zm2.75.629.599-.599a1.195 1.195 0 1 0-1.69-1.689l-.598.599 1.69 1.689Z"
      />
    </svg>
    """
  end

  def external_small(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path d="M11.75 4.5a.75.75 0 0 0 0 1.5h1.19l-2.72 2.72a.75.75 0 1 0 1.06 1.06l2.72-2.72v1.19a.75.75 0 0 0 1.5 0v-3a.75.75 0 0 0-.75-.75h-3Z" /><path d="M15 11.25a.75.75 0 0 0-1.5 0v1c0 .69-.56 1.25-1.25 1.25h-4.5c-.69 0-1.25-.56-1.25-1.25v-4.5c0-.69.56-1.25 1.25-1.25h1a.75.75 0 0 0 0-1.5h-1a2.75 2.75 0 0 0-2.75 2.75v4.5a2.75 2.75 0 0 0 2.75 2.75h4.5a2.75 2.75 0 0 0 2.75-2.75v-1Z" />
    </svg>
    """
  end

  def info(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path d="M10 14a.75.75 0 0 1-.75-.75v-3.5a.75.75 0 0 1 1.5 0v3.5a.75.75 0 0 1-.75.75Z" /><path d="M9 7a1 1 0 1 1 2 0 1 1 0 0 1-2 0Z" /><path
        fill-rule="evenodd"
        d="M17 10a7 7 0 1 1-14 0 7 7 0 0 1 14 0Zm-1.5 0a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0Z"
      />
    </svg>
    """
  end

  def layout_columns_1(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path
        fill-rule="evenodd"
        d="M4 6.75c0-2.071 1.679-3.75 3.75-3.75h4.5c2.071 0 3.75 1.679 3.75 3.75v6.5c0 2.071-1.679 3.75-3.75 3.75h-4.5c-2.071 0-3.75-1.679-3.75-3.75v-6.5Zm3.75-2.25c-1.243 0-2.25 1.007-2.25 2.25v6.5c0 1.243 1.007 2.25 2.25 2.25h4.5c1.243 0 2.25-1.007 2.25-2.25v-6.5c0-1.243-1.007-2.25-2.25-2.25h-4.5Z"
      />
    </svg>
    """
  end

  def layout_columns_2(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path
        fill-rule="evenodd"
        d="M6.75 3c-2.071 0-3.75 1.679-3.75 3.75v6.5c0 2.071 1.679 3.75 3.75 3.75h6.5c2.071 0 3.75-1.679 3.75-3.75v-6.5c0-2.071-1.679-3.75-3.75-3.75h-6.5Zm-2.25 3.75c0-1.243 1.007-2.25 2.25-2.25h2.5v11h-2.5c-1.243 0-2.25-1.007-2.25-2.25v-6.5Zm6.25 8.75h2.5c1.243 0 2.25-1.007 2.25-2.25v-6.5c0-1.243-1.007-2.25-2.25-2.25h-2.5v11Z"
      />
    </svg>
    """
  end

  def layout_columns_3(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path
        fill-rule="evenodd"
        d="M3 6.75c0-2.071 1.679-3.75 3.75-3.75h6.5c2.071 0 3.75 1.679 3.75 3.75v6.5c0 2.071-1.679 3.75-3.75 3.75h-6.5c-2.071 0-3.75-1.679-3.75-3.75v-6.5Zm3.75-2.25c-1.243 0-2.25 1.007-2.25 2.25v6.5c0 1.243 1.007 2.25 2.25 2.25h.5v-11h-.5Zm4.5 11h-2.5v-11h2.5v11Zm1.5 0h.5c1.243 0 2.25-1.007 2.25-2.25v-6.5c0-1.243-1.007-2.25-2.25-2.25h-.5v11Z"
      />
    </svg>
    """
  end

  def lock(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path d="M10.75 13.05a1.5 1.5 0 1 0-1.5 0v.45a.75.75 0 0 0 1.5 0v-.45Z" /><path
        fill-rule="evenodd"
        d="M6.25 7.095v-.345a3.75 3.75 0 1 1 7.5 0v.345a3.001 3.001 0 0 1 2.25 2.905v4a3 3 0 0 1-3 3h-6a3 3 0 0 1-3-3v-4a3 3 0 0 1 2.25-2.905Zm1.5-.345a2.25 2.25 0 0 1 4.5 0v.25h-4.5v-.25Zm-2.25 3.25a1.5 1.5 0 0 1 1.5-1.5h6a1.5 1.5 0 0 1 1.5 1.5v4a1.5 1.5 0 0 1-1.5 1.5h-6a1.5 1.5 0 0 1-1.5-1.5v-4Z"
      />
    </svg>
    """
  end

  def plus(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path d="M10.75 5.75c0-.414-.336-.75-.75-.75s-.75.336-.75.75v3.5h-3.5c-.414 0-.75.336-.75.75s.336.75.75.75h3.5v3.5c0 .414.336.75.75.75s.75-.336.75-.75v-3.5h3.5c.414 0 .75-.336.75-.75s-.336-.75-.75-.75h-3.5v-3.5Z" />
    </svg>
    """
  end

  def plus_circle(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path d="M6.25 10a.75.75 0 0 1 .75-.75h2.25v-2.25a.75.75 0 0 1 1.5 0v2.25h2.25a.75.75 0 0 1 0 1.5h-2.25v2.25a.75.75 0 0 1-1.5 0v-2.25h-2.25a.75.75 0 0 1-.75-.75Z" /><path
        fill-rule="evenodd"
        d="M1 17a7 7 0 1 0 0-14 7 7 0 0 0 0 14Zm0-1.5a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11Z"
      />
    </svg>
    """
  end

  def search(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path
        fill-rule="evenodd"
        d="M12.323 13.383a5.5 5.5 0 1 1 1.06-1.06l2.897 2.897a.75.75 0 1 1-1.06 1.06l-2.897-2.897Zm.677-4.383a4 4 0 1 1-8 0 4 4 0 0 1 8 0Z"
      />
    </svg>
    """
  end

  def select(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path d="M10.884 4.323a1.25 1.25 0 0 0-1.768 0l-2.646 2.647a.75.75 0 0 0 1.06 1.06l2.47-2.47 2.47 2.47a.75.75 0 1 0 1.06-1.06l-2.646-2.647Z" /><path d="m13.53 13.03-2.646 2.647a1.25 1.25 0 0 1-1.768 0l-2.646-2.647a.75.75 0 0 1 1.06-1.06l2.47 2.47 2.47-2.47a.75.75 0 0 1 1.06 1.06Z" />
    </svg>
    """
  end

  def x_circle(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path d="M13.03 6.97a.75.75 0 0 1 0 1.06l-1.97 1.97 1.97 1.97a.75.75 0 1 1-1.06 1.06l-1.97-1.97-1.97 1.97a.75.75 0 0 1-1.06-1.06l1.97-1.97-1.97-1.97a.75.75 0 0 1 1.06-1.06l1.97 1.97 1.97-1.97a.75.75 0 0 1 1.06 0Z" /><path
        fill-rule="evenodd"
        d="M10 17a7 7 0 1 0 0-14 7 7 0 0 0 0 14Zm0-1.5a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11Z"
      />
    </svg>
    """
  end

  def x_small(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path d="M12.72 13.78a.75.75 0 1 0 1.06-1.06l-2.72-2.72 2.72-2.72a.75.75 0 0 0-1.06-1.06l-2.72 2.72-2.72-2.72a.75.75 0 0 0-1.06 1.06l2.72 2.72-2.72 2.72a.75.75 0 1 0 1.06 1.06l2.72-2.72 2.72 2.72Z" />
    </svg>
    """
  end

  def view(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path
        fill-rule="evenodd"
        d="M13 10a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-1.5 0a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0Z"
      /><path
        fill-rule="evenodd"
        d="M10 4c-2.476 0-4.348 1.23-5.577 2.532a9.266 9.266 0 0 0-1.4 1.922 5.98 5.98 0 0 0-.37.818c-.082.227-.153.488-.153.728s.071.501.152.728c.088.246.213.524.371.818.317.587.784 1.27 1.4 1.922 1.229 1.302 3.1 2.532 5.577 2.532 2.476 0 4.348-1.23 5.577-2.532a9.265 9.265 0 0 0 1.4-1.922 5.98 5.98 0 0 0 .37-.818c.082-.227.153-.488.153-.728s-.071-.501-.152-.728a5.984 5.984 0 0 0-.371-.818 9.269 9.269 0 0 0-1.4-1.922c-1.229-1.302-3.1-2.532-5.577-2.532Zm-5.999 6.002v-.004c.004-.02.017-.09.064-.223a4.5 4.5 0 0 1 .278-.608 7.768 7.768 0 0 1 1.17-1.605c1.042-1.104 2.545-2.062 4.487-2.062 1.942 0 3.445.958 4.486 2.062a7.77 7.77 0 0 1 1.17 1.605c.13.24.221.447.279.608.047.132.06.203.064.223v.004c-.004.02-.017.09-.064.223a4.503 4.503 0 0 1-.278.608 7.768 7.768 0 0 1-1.17 1.605c-1.042 1.104-2.545 2.062-4.487 2.062-1.942 0-3.445-.958-4.486-2.062a7.766 7.766 0 0 1-1.17-1.605 4.5 4.5 0 0 1-.279-.608c-.047-.132-.06-.203-.064-.223Z"
      />
    </svg>
    """
  end
end
