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
var ShopifyFormInputEvent = {
  mounted() {
    this.el.addEventListener("input", () => {
      (e) => console.log("Real-time:", e.target.value);
    });
    this.el.addEventListener("change", () => {
      (e) => console.log("Realish-time:", e.target.value);
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
  OctantisInteractable,
  ShopifyAppBridgeModal,
  ShopifyFormInputEvent,
  ShopifyModal,
  ShopifyToastHook
};
//# sourceMappingURL=octantis.mjs.map
