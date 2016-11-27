if ($('h1').text().length) {
  var abc = $('h1').text();
  App.messages = App.cable.subscriptions.create({channel: 'MessagesChannel', access_token: abc}, {
    received: function(data) {
      $("#messages").not(".hidden #messages").removeClass('hidden')
      return $('#messages').not(".hidden #messages").append(this.renderMessage(data));
    },
    renderMessage: function(data) {
      return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
    }
  });
}
