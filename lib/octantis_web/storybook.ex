defmodule OctantisWeb.Storybook do
  @moduledoc """
  Storybook Modle to Power PhoenixStorybook

  See:
   - https://github.com/phenixdigital/phoenix_storybook
  """

  use PhoenixStorybook,
    otp_app: :octantis,
    content_path: Path.expand("../../storybook", __DIR__),
    # assets path are remote path, not local file-system paths
    css_path: "/assets/storybook.css",
    js_path: "/assets/storybook.js",
    sandbox_class: "octantis-web"
end
