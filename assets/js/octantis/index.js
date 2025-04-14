/* Hooks for Octantais components.
 *
 * @module octantis
 */

const ShopifyModal = {
  mounted(){
    id = this.el.id
    this.handleEvent(`octantis:modal_show_${id}`, (event) => this.liveSocket.execJS(this.el, this.el.getAttribute("data-show")))
    this.handleEvent(`octantis:modal_hide_${id}`, (event) => this.liveSocket.execJS(this.el, this.el.getAttribute("data-hide")))
  }
}

const ShopifyAppBridgeModal = {
  mounted(){
    id = this.el.id
    window.addEventListener(`polaris:app_bridge_modal_show_${id}`, e => this.el.show());
    window.addEventListener(`polaris:app_bridge_modal_show_${id}`, e => this.el.hide());
    this.handleEvent(`octantis:app_bridge_modal_show_${id}`, (event) => this.liveSocket.execJS(this.el, this.el.getAttribute("data-show")))
    this.handleEvent(`octantis:app_bridge_modal_hide_${id}`, (event) => this.liveSocket.execJS(this.el, this.el.getAttribute("data-hide")))
  }
}

/*
Handles the integration between flash to a Shopify AppBridge Toast

See ShopAdminComponents.toast
*/
const ShopifyToastHook = {
  mounted() {
    shopify.toast.show(this.el.dataset.message, {
      onDismiss: () => {
        this.pushEvent("lv:clear-flash", {value: {key: this.el.dataset.kind}})
      },
      isError: this.el.dataset.kind == 'error'
    });
  },
  updated() {
    shopify.toast.show(this.el.dataset.message, {
      onDismiss: () => {
        this.pushEvent("lv:clear-flash", {value: {key: this.el.dataset.kind}})
      },
      isError: this.el.dataset.kind == 'error'
    });
  }
}

export { ShopifyAppBridgeModal, ShopifyModal, ShopifyToastHook }
