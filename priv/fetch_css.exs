# Fetch the Polaris CSS and put it into the assets/vendor directory

polaris_css = Req.get!("https://unpkg.com/@shopify/polaris@13.9.0/build/esm/styles.css").body

File.write!("assets/vendor/polaris-13.9.0-styles.css", polaris_css)
