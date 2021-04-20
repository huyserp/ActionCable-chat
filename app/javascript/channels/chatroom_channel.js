import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('message-box');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        console.log(data); // Called when there's incoming data on the websocket for this channel
        messagesContainer.insertAdjacentHTML('beforeend', data);
      }
    });
  }
}

export { initChatroomCable };


