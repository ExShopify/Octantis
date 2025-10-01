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
    AppBridgeNavManu: () => AppBridgeNavManu,
    OctantisEventProxy: () => OctantisEventProxy,
    OctantisInteractable: () => OctantisInteractable,
    ShopifyAppBridgeModal: () => ShopifyAppBridgeModal,
    ShopifyModal: () => ShopifyModal,
    ShopifyToastHook: () => ShopifyToastHook
  });
  var ShopifyModal = {
    mounted() {
      id = this.el.id;
      this.handleEvent(`octantis:modal_show_${id}`, (event) => this.liveSocket.execJS(this.el, this.el.getAttribute("data-show")));
      this.handleEvent(`octantis:modal_hide_${id}`, (event) => this.liveSocket.execJS(this.el, this.el.getAttribute("data-hide")));
    }
  };
  var ShopifyAppBridgeModal = {
    mounted() {
      id = this.el.id;
      window.addEventListener(`polaris:app_bridge_modal_show_${id}`, (e) => this.el.show());
      window.addEventListener(`polaris:app_bridge_modal_hide_${id}`, (e) => this.el.hide());
      this.handleEvent(`octantis:app_bridge_modal_show_${id}`, (event) => this.liveSocket.execJS(this.el, this.el.getAttribute("data-show")));
      this.handleEvent(`octantis:app_bridge_modal_hide_${id}`, (event) => this.liveSocket.execJS(this.el, this.el.getAttribute("data-hide")));
    }
  };
  var OctantisInteractable = {
    mounted() {
      this.handleEvent(
        `octantis:interactable_${this.el.id}`,
        (event) => this.liveSocket.execJS(this.el, this.el.getAttribute(event.key))
      );
    }
  };
  var OctantisEventProxy = {
    mounted() {
      proxyEvents = (this.el.getAttribute("data-octantis-proxy-events") || "").split(",");
      proxyEvents.forEach((proxyEvent) => {
        this.el[`on${proxyEvent}`] = (e) => {
          jsCommand = this.el.getAttribute(`data-octantis-${proxyEvent}`);
          input_proxy = this.el.nextElementSibling && this.el.nextElementSibling.tagName == "INPUT" && this.el.nextElementSibling.id == `OctantisHiddenInput${this.el.id}` && this.el.nextElementSibling;
          if (jsCommand) {
            this.liveSocket.execJS(this.el, jsCommand);
          }
          if (input_proxy) {
            input_proxy.value = e.currentTarget.value;
            input_proxy.dispatchEvent(new Event(proxyEvent, { bubbles: true }));
          }
        };
      });
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
  var AppBridgeNavManu = {
    mounted() {
      this.el.addEventListener("click", (event) => {
        event.preventDefault();
        this.liveSocket.execJS(this.el, this.el.getAttribute("data-nav-event"));
      });
    }
  };
  return __toCommonJS(octantis_exports);
})();
