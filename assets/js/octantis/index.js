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
    window.addEventListener(`polaris:app_bridge_modal_hide_${id}`, e => this.el.hide());
    this.handleEvent(`octantis:app_bridge_modal_show_${id}`, (event) => this.liveSocket.execJS(this.el, this.el.getAttribute("data-show")))
    this.handleEvent(`octantis:app_bridge_modal_hide_${id}`, (event) => this.liveSocket.execJS(this.el, this.el.getAttribute("data-hide")))
  }
}

const OctantisInteractable = {
  mounted(){
    this.handleEvent(`octantis:interactable_${this.el.id}`,
      (event) => this.liveSocket.execJS(this.el, this.el.getAttribute(event.key))
    )
  }
}

/* Hooks for Octantais WebComponents.
 *
 * Proxy Polaris WecComponent events to Liveview
 */

const OctantisEventProxy = {
   mounted() {
     // Polaris WebComponents puts its input into a Shadow DOM and Phoenix no longer sees it.
     // instead we proxy events through a hidden input
     // See https://shopify.dev/docs/api/app-home/using-polaris-components?accordionItem=event-handling-technical-details
     if (this.el.nextElementSibling && this.el.nextElementSibling.tagName == "INPUT" &&
       this.el.nextElementSibling.id == `OctantisHiddenInput${this.el.id}`) {
       input_proxy = this.el.nextElementSibling
     } else {
       input_proxy = null
     }

     proxyEvents = (this.el.getAttribute("data-octantis-proxy-events") || "").split(",");
     proxyEvents.forEach((proxyEvent) => {
       this.el[`on${proxyEvent}`] = (e) => {
         jsCommand = this.el.getAttribute(`data-octantis-${proxyEvent}`)
         console.log(jsCommand)
         if (jsCommand) { this.liveSocket.execJS(this.el, jsCommand) }
         if (input_proxy) {
           input_proxy.value = e.currentTarget.value
           input_proxy.dispatchEvent(new Event(proxyEvent, { bubbles: true }))
         }
       }
     })
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

const AppBridgeNavManu = {
  mounted(){
    this.el.addEventListener('click', (event) => {
      event.preventDefault();
      this.liveSocket.execJS(this.el, this.el.getAttribute("data-nav-event"));
    });
  }
}

export { AppBridgeNavManu, OctantisInteractable, ShopifyAppBridgeModal, ShopifyModal, ShopifyToastHook, OctantisEventProxy }
