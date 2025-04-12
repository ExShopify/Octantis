// js/octantis/index.js
var ShopifyHideOnNavigate = {
  mounted() {
    el = this.el;
    console.log("mounted");
    window.onmessage = (event) => {
      console.log("onmessage");
      if (event.origin == "https://admin.shopify.com" && event.data?.payload?.group == "Navigation" && event.data?.payload?.type == "APP::NAVIGATION::REDIRECT::APP") {
        console.log("hide");
      }
    };
  }
};
export {
  ShopifyHideOnNavigate
};
//# sourceMappingURL=octantis.mjs.map
