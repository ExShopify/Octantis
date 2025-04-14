// js/octantis/index.js
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
export {
  ShopifyModal,
  ShopifyToastHook
};
//# sourceMappingURL=octantis.mjs.map
