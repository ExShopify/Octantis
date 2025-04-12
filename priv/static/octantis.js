var Octantis = (() => {
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
    ShopifyHideOnNavigate: () => ShopifyHideOnNavigate,
    ShopifyModal: () => ShopifyModal,
    ShopifyToastHook: () => ShopifyToastHook
  });
  var ShopifyHideOnNavigate = {
    mounted() {
      window.onmessage = (event) => {
        var _a, _b, _c, _d;
        if (event.origin == "https://admin.shopify.com" && ((_b = (_a = event.data) == null ? void 0 : _a.payload) == null ? void 0 : _b.group) == "Navigation" && ((_d = (_c = event.data) == null ? void 0 : _c.payload) == null ? void 0 : _d.type) == "APP::NAVIGATION::REDIRECT::APP") {
          this.liveSocket.execJS(this.el, this.el.getAttribute("data-hide"));
        }
      };
    }
  };
  var ShopifyModal = {
    mounted() {
      id = this.el.id;
      this.handleEvent(`polaris:modal_show_${id}`, (event) => this.liveSocket.execJS(this.el, this.el.getAttribute("data-show")));
      this.handleEvent(`polaris:modal_hide_${id}`, (event) => this.liveSocket.execJS(this.el, this.el.getAttribute("data-hide")));
    }
  };
  var ShopifyToastHook = {
    mounted() {
      shopify.toast.show(this.el.dataset.message, {
        onDismiss: () => {
          this.pushEvent("lv:clear-flash", { value: { key: this.el.dataset.kind } });
        },
        isError: this.el.dataset.kind == "error"
      });
    },
    updated() {
      shopify.toast.show(this.el.dataset.message, {
        onDismiss: () => {
          this.pushEvent("lv:clear-flash", { value: { key: this.el.dataset.kind } });
        },
        isError: this.el.dataset.kind == "error"
      });
    }
  };
  return __toCommonJS(octantis_exports);
})();
