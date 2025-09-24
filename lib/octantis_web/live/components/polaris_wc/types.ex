defmodule OctantisWeb.Components.PolarisWC.Types do
  @moduledoc """
  Enumerations of types commonly found in Polaris


  TODOs:
    * BorderShorthand
    * MaybeAllValuesShorthandProperty\<BoxBorderRadii
    * MaybeResponsive\<MaybeAllValuesShorthandProperty\<PaddingKeyword>>
    * MaybeResponsive<"" | MaybeTwoValuesShorthandProperty\<PaddingKeyword>>
    * MaybeResponsive<"" | PaddingKeyword>
    * MaybeResponsive<"" | MaybeTwoValuesShorthandProperty\<PaddingKeyword>>
  """

  @binding_prefix Application.compile_env(:octantis, :binding_prefix, "data-phx-")

  def put_options(type, opts)

  def put_options(:accessibility_role, opts), do: Keyword.put(opts, :values, colours())

  def put_options(:accessibility_visibility, opts),
    do: Keyword.put(opts, :values, accessibility_visibility())

  def put_options(:background_color, opts), do: Keyword.put(opts, :background_color, colours())
  def put_options(:color, opts), do: Keyword.put(opts, :values, colours())
  def put_options(:command, opts), do: Keyword.put(opts, :values, commands())
  def put_options(:icon, opts), do: Keyword.put(opts, :values, icons())
  def put_options(:target, opts), do: Keyword.put(opts, :values, targets())
  def put_options(:tone, opts), do: Keyword.put(opts, :values, tones())
  def put_options(:direction, opts), do: Keyword.put(opts, :values, direction())
  def put_options({:responsive, _}, opts), do: opts
  def put_options(:overflow, opts), do: Keyword.put(opts, :values, overflow())
  def put_options(:padding, opts), do: Keyword.put(opts, :values, padding())
  def put_options(:variant, opts), do: Keyword.put(opts, :values, variants())
  def put_options(_no_values, opts), do: opts

  def get_base_type(:size_units), do: :any
  def get_base_type(:size_units_or_auto), do: :any
  def get_base_type(:size_units_or_none), do: :any
  def get_base_type({:responsive, _}), do: :any
  def get_base_type({:event, _}), do: :any
  def get_base_type(_), do: :string

  @doc """
  Get the name of the attribute to be given to the WebComponent.

  We override some of these to match LiveView names. For example
  :click -> "data-phx-click"

  ## Examples
    iex> attribute_name(:color)
    "color"

    iex> attribute_name(:accessibility_label)
    "accessibilityLabel"

    iex> attribute_name(:click)
    "data-phx-click"

    iex> attribute_name(:blur)
    "data-phx-blur"

    iex> attribute_name(:focus)
    "data-phx-focus"
  """
  def attribute_name(:click), do: @binding_prefix <> "click"
  def attribute_name(:blur), do: @binding_prefix <> "blur"
  def attribute_name(:focus), do: @binding_prefix <> "focus"

  def attribute_name(name) do
    [first | rest] = name |> Atom.to_string() |> Macro.camelize() |> String.graphemes()
    String.downcase(first) <> Enum.join(rest)
  end

  @doc """
  A sigil for defining responsive values

  ## Examples
    iex> ~o["inline" <= "200px" < "block"]r
    {:responsive, {:<=, "200px", "inline", "block"}}

    iex> ~o["inline" < {200, :px} < "block"]r
    {:responsive, {:<, {200, :px}, "inline", "block"}}

    iex> ~o["inline" < "200px" < "block" <= "400px" < "outline"]r
    {:responsive, {:<, "200px", "inline", {:<=, "400px", "block", "outline"}}}

    iex> ~o["inline" < {200, :px} < "block" < {400, :px} < "outline"]r
    {:responsive, {:<, {200, :px}, "inline", {:<, {400, :px}, "block", "outline"}}}

    iex> ~o["inline" < {200, :px} < "block" < {400, :px} < "outline" < {600, :px} < "extremity"]r
    {:responsive, {:<, {200, :px}, "inline", {:<, {400, :px}, "block", {:<, {600, :px}, "outline", "extremity"}}}}
  """
  defmacro sigil_o({:<<>>, _meta, [binary]}, ~c"r") do
    quoted = Code.string_to_quoted!(binary)

    responsive = build_responsive(quoted)

    Macro.escape({:responsive, responsive})
  end

  defp build_responsive(expression) do
    {_ast, {operators, leafs}} =
      Macro.prewalk(expression, {[], []}, fn
        {operator, meta, children}, {operators, leafs} when operator in [:<, :<=] ->
          {{operator, meta, children}, {[operator | operators], leafs}}

        leaf, {operators, leafs} ->
          {nil, {operators, [leaf | leafs]}}
      end)

    build_responsive_from_list(Enum.reverse(leafs), operators)
  end

  defp build_responsive_from_list([value, break | tail], [op, _op2 | operators]),
    do: {op, break, value, build_responsive_from_list(tail, operators)}

  defp build_responsive_from_list([tail], []), do: tail

  defp build_responsive_from_list(_, _) do
    raise ArgumentError,
      message: "invalid argument. ~o[]r expects the format `value < breakpoint < value`"
  end

  def accessibility_role do
    [
      "main",
      "header",
      "footer",
      "section",
      "aside",
      "navigation",
      "ordered-list",
      "list-item",
      "list-item-separator",
      "unordered-list",
      "separator",
      "status",
      "alert",
      "generic",
      "presentation",
      "none"
    ]
  end

  def accessibility_visibility, do: ["visible", "hidden", "exclusive"]

  def background_color, do: ["transparent", "subdued", "base", "strong"]

  def colours, do: ["subdued", "base", "strong"]

  def commands, do: ["--auto", "--show", "--hide", "--toggle"]

  def direction, do: ["inline", "block"]

  def targets, do: ["auto", "_blank", "_self", "_parent", "_top"]

  def tones, do: ["info", "success", "warning", "critical", "auto", "neutral", "caution"]

  def icons do
    [
      "",
      "replace",
      "search",
      "link",
      "product",
      "variant",
      "collection",
      "select",
      "info",
      "incomplete",
      "complete",
      "color",
      "money",
      "adjust",
      "affiliate",
      "airplane",
      "alert-bubble",
      "alert-circle",
      "alert-diamond",
      "alert-location",
      "alert-octagon-filled",
      "alert-octagon",
      "alert-triangle-filled",
      "alert-triangle",
      "app-extension",
      "apps",
      "archive",
      "arrow-down-circle",
      "arrow-down-right",
      "arrow-down",
      "arrow-left-circle",
      "arrow-left",
      "arrow-right-circle",
      "arrow-right",
      "arrow-up-circle",
      "arrow-up-right",
      "arrow-up",
      "arrows-in-horizontal",
      "arrows-out-horizontal",
      "attachment",
      "automation",
      "backspace",
      "bag",
      "bank",
      "barcode",
      "bill",
      "blank",
      "blog",
      "bolt-filled",
      "bolt",
      "book-open",
      "book",
      "bug",
      "bullet",
      "business-entity",
      "button-press",
      "button",
      "calculator",
      "calendar-check",
      "calendar-compare",
      "calendar-list",
      "calendar-time",
      "calendar",
      "camera-flip",
      "camera",
      "caret-down",
      "caret-left",
      "caret-right",
      "caret-up",
      "cart-abandoned",
      "cart-discount",
      "cart-down",
      "cart-sale",
      "cart-up",
      "cart",
      "cash-dollar",
      "cash-euro",
      "cash-pound",
      "cash-rupee",
      "cash-yen",
      "catalog-product",
      "categories",
      "channels",
      "chart-cohort",
      "chart-donut",
      "chart-funnel",
      "chart-histogram-first-last",
      "chart-histogram-first",
      "chart-histogram-flat",
      "chart-histogram-full",
      "chart-histogram-growth",
      "chart-histogram-last",
      "chart-histogram-second-last",
      "chart-horizontal",
      "chart-line",
      "chart-popular",
      "chart-stacked",
      "chart-vertical",
      "chat-new",
      "chat-referral",
      "chat",
      "check-circle-filled",
      "check-circle",
      "check",
      "checkbox",
      "chevron-down-circle",
      "chevron-down",
      "chevron-left-circle",
      "chevron-left",
      "chevron-right-circle",
      "chevron-right",
      "chevron-up-circle",
      "chevron-up",
      "circle-dashed",
      "circle",
      "clipboard-check",
      "clipboard-checklist",
      "clipboard",
      "clock-revert",
      "clock",
      "code-add",
      "code",
      "collection-featured",
      "collection-list",
      "collection-reference",
      "color-none",
      "compass",
      "compose",
      "confetti",
      "connect",
      "content",
      "contract",
      "corner-pill",
      "corner-round",
      "corner-square",
      "credit-card-cancel",
      "credit-card-percent",
      "credit-card-reader-chip",
      "credit-card-reader-tap",
      "credit-card-reader",
      "credit-card-secure",
      "credit-card-tap-chip",
      "credit-card",
      "crop",
      "currency-convert",
      "cursor-banner",
      "cursor-option",
      "cursor",
      "data-presentation",
      "data-table",
      "database-add",
      "database-connect",
      "database",
      "delete",
      "delivered",
      "delivery",
      "desktop",
      "disabled",
      "discount-add",
      "discount-code",
      "discount",
      "dns-settings",
      "dock-floating",
      "dock-side",
      "domain-landing-page",
      "domain-new",
      "domain-redirect",
      "domain",
      "download",
      "drag-drop",
      "drag-handle",
      "duplicate",
      "edit",
      "email-follow-up",
      "email-newsletter",
      "email",
      "empty",
      "enabled",
      "enter",
      "envelope-soft-pack",
      "envelope",
      "eraser",
      "exchange",
      "exit",
      "export",
      "external",
      "eye-check-mark",
      "eye-dropper-list",
      "eye-dropper",
      "eye-first",
      "eyeglasses",
      "fav",
      "favicon",
      "file-list",
      "file",
      "filter-active",
      "filter",
      "flag",
      "flip-horizontal",
      "flip-vertical",
      "flower",
      "folder-add",
      "folder-down",
      "folder-remove",
      "folder-up",
      "folder",
      "food",
      "foreground",
      "forklift",
      "forms",
      "games",
      "gauge",
      "geolocation",
      "gift-card",
      "gift",
      "git-branch",
      "git-commit",
      "git-repository",
      "globe-asia",
      "globe-europe",
      "globe-lines",
      "globe-list",
      "globe",
      "grid",
      "hashtag-decimal",
      "hashtag-list",
      "hashtag",
      "heart",
      "hide-filled",
      "hide",
      "home",
      "icons",
      "identity-card",
      "image-add",
      "image-alt",
      "image-explore",
      "image-magic",
      "image-none",
      "image-with-text-overlay",
      "image",
      "images",
      "import",
      "in-progress",
      "incentive",
      "incoming",
      "info-filled",
      "inheritance",
      "inventory-updated",
      "inventory",
      "iq",
      "key",
      "keyboard-filled",
      "keyboard-hide",
      "keyboard",
      "label-printer",
      "language-translate",
      "language",
      "layout-block",
      "layout-buy-button-horizontal",
      "layout-buy-button-vertical",
      "layout-buy-button",
      "layout-column-1",
      "layout-columns-2",
      "layout-columns-3",
      "layout-footer",
      "layout-header",
      "layout-logo-block",
      "layout-popup",
      "layout-rows-2",
      "layout-section",
      "layout-sidebar-left",
      "layout-sidebar-right",
      "lightbulb",
      "link-list",
      "list-bulleted",
      "list-numbered",
      "live",
      "location-none",
      "location",
      "lock",
      "map",
      "markets-euro",
      "markets-rupee",
      "markets-yen",
      "markets",
      "maximize",
      "measurement-size-list",
      "measurement-size",
      "measurement-volume-list",
      "measurement-volume",
      "measurement-weight-list",
      "measurement-weight",
      "media-receiver",
      "megaphone",
      "mention",
      "menu-horizontal",
      "menu-vertical",
      "menu",
      "merge",
      "metafields",
      "metaobject-list",
      "metaobject-reference",
      "metaobject",
      "microphone",
      "minimize",
      "minus-circle",
      "minus",
      "mobile",
      "money-none",
      "moon",
      "nature",
      "note-add",
      "note",
      "notification",
      "order-batches",
      "order-draft",
      "order-first",
      "order-fulfilled",
      "order-repeat",
      "order-unfulfilled",
      "order",
      "orders-status",
      "organization",
      "outdent",
      "outgoing",
      "package-fulfilled",
      "package-on-hold",
      "package-returned",
      "package",
      "page-add",
      "page-attachment",
      "page-clock",
      "page-down",
      "page-heart",
      "page-list",
      "page-reference",
      "page-remove",
      "page-report",
      "page-up",
      "page",
      "pagination-end",
      "pagination-start",
      "paint-brush-flat",
      "paint-brush-round",
      "paper-check",
      "partially-complete",
      "passkey",
      "paste",
      "pause-circle",
      "payment-capture",
      "payment",
      "payout-dollar",
      "payout-euro",
      "payout-pound",
      "payout-rupee",
      "payout-yen",
      "payout",
      "person-add",
      "person-exit",
      "person-list",
      "person-lock",
      "person-remove",
      "person-segment",
      "person",
      "personalized-text",
      "phone-in",
      "phone-out",
      "phone",
      "pin-remove",
      "pin",
      "plan",
      "play-circle",
      "play",
      "plus-circle-down",
      "plus-circle-filled",
      "plus-circle-up",
      "plus-circle",
      "plus",
      "point-of-sale",
      "price-list",
      "print",
      "product-add",
      "product-cost",
      "product-list",
      "product-reference",
      "product-remove",
      "product-return",
      "product-unavailable",
      "profile-filled",
      "profile",
      "question-circle-filled",
      "question-circle",
      "receipt-dollar",
      "receipt-euro",
      "receipt-folded",
      "receipt-paid",
      "receipt-pound",
      "receipt-refund",
      "receipt-rupee",
      "receipt-yen",
      "receipt",
      "receivables",
      "redo",
      "referral-code",
      "refresh",
      "remove-background",
      "reorder",
      "replay",
      "reset",
      "return",
      "reward",
      "rocket",
      "rotate-left",
      "rotate-right",
      "sandbox",
      "save",
      "savings",
      "search-add",
      "search-list",
      "search-recent",
      "search-resource",
      "send",
      "settings",
      "share",
      "shield-check-mark",
      "shield-none",
      "shield-pending",
      "shield-person",
      "shipping-label",
      "shopcodes",
      "slideshow",
      "smiley-happy",
      "smiley-joy",
      "smiley-neutral",
      "smiley-sad",
      "social-ad",
      "social-post",
      "sort-ascending",
      "sort-descending",
      "sort",
      "sound",
      "sports",
      "star-filled",
      "star-half",
      "star-list",
      "star",
      "status-active",
      "status",
      "stop-circle",
      "store-import",
      "store-managed",
      "store-online",
      "store",
      "sun",
      "table-masonry",
      "table",
      "tablet",
      "target",
      "tax",
      "team",
      "text-align-center",
      "text-align-left",
      "text-align-right",
      "text-block",
      "text-bold",
      "text-color",
      "text-font-list",
      "text-font",
      "text-grammar",
      "text-in-columns",
      "text-in-rows",
      "text-indent-remove",
      "text-indent",
      "text-italic",
      "text-quote",
      "text-title",
      "text-underline",
      "text-with-image",
      "text",
      "theme-edit",
      "theme-store",
      "theme-template",
      "theme",
      "three-d-environment",
      "thumbs-down",
      "thumbs-up",
      "tip-jar",
      "toggle-off",
      "toggle-on",
      "transaction-fee-dollar",
      "transaction-fee-euro",
      "transaction-fee-pound",
      "transaction-fee-rupee",
      "transaction-fee-yen",
      "transaction",
      "transfer-in",
      "transfer-internal",
      "transfer-out",
      "transfer",
      "truck",
      "undo",
      "unknown-device",
      "unlock",
      "upload",
      "view",
      "viewport-narrow",
      "viewport-short",
      "viewport-tall",
      "viewport-wide",
      "wallet",
      "wand",
      "watch",
      "wifi",
      "work-list",
      "work",
      "wrench",
      "x-circle-filled",
      "x-circle",
      "x"
    ]
  end

  def overflow, do: ["visible", "hidden"]

  def padding, do: ["base", "none"]

  def variants, do: ["auto", "primary", "secondary", "tertiary"]
end
