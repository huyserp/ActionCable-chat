import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('message-box');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        console.log(data);
        // Called when there's incoming data on the websocket for this channel
      }
    });
  }
}

  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  export { initChatroomCable };


