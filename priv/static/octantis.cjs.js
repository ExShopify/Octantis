var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __export = (target, all) => {
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

// js/octantis/index.js
var octantis_exports = {};
__export(octantis_exports, {
  ShopifyHideOnNavigate: () => ShopifyHideOnNavigate
});
module.exports = __toCommonJS(octantis_exports);
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
//# sourceMappingURL=octantis.cjs.js.map
