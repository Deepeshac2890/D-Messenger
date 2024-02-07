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
    // $('#chatHistory').append(data.message)
    location.reload()
    // var list = document.getElementById('chatHistory');
    // if (list) {
    //   list.scrollTop = list.scrollHeight;
    // }
  }
});
