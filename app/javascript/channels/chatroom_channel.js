import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    // Option 1 : Render using the partial 
    // $('#chatHistory').append(data.message)
    // Option 2 : Reload the page this solves more issues.
    location.reload()
  }
});
