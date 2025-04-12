/* Hooks for Octantais components.
 *
 * @module octantis
 */


const ShopifyHideOnNavigate = {
  mounted(){
    window.onmessage = (event) => {
      if (event.origin == "https://admin.shopify.com" &&
          event.data?.payload?.group == "Navigation" &&
          event.data?.payload?.type == "APP::NAVIGATION::REDIRECT::APP"
      ) {
        this.liveSocket.execJS(this.el, this.el.getAttribute("data-hide"))
      }
    }
  }
}

const ShopifyModal = {
  mounted(){
    id = this.el.id
    this.handleEvent(`polaris:modal_show_${id}`, (event) => this.liveSocket.execJS(this.el, this.el.getAttribute("data-show")))
    this.handleEvent(`polaris:modal_hide_${id}`, (event) => this.liveSocket.execJS(this.el, this.el.getAttribute("data-hide")))
  }
}

export { ShopifyHideOnNavigate, ShopifyModal }
