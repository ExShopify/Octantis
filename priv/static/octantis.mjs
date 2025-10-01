// js/octantis/index.js
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
export {
  AppBridgeNavManu,
  OctantisEventProxy,
  OctantisInteractable,
  ShopifyAppBridgeModal,
  ShopifyModal,
  ShopifyToastHook
};
//# sourceMappingURL=octantis.mjs.map
