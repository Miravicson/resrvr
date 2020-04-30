import socket from './socket';


(function(){
  let id = document.querySelector('#id').dataset['id'];
  if(!id) return;

  let channel = socket.channel("event:" + id, {});

  channel.on("update_quantity", event => {
    console.log("Update", event);
    document.querySelector('h4 span').textContent = event.quantity;
  })

  channel.join()
  .receive("ok", res => {
    console.log("Joined successfully event:" + id, res)
  })
  .receive("error", res => {
    console.log("Unable to join", res)
  });
})();