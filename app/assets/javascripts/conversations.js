$(document).ready( function() {
  if ($('h1').text().length) {
    submitNewMessage();
  }
});

function submitNewMessage(){
  $('textarea#message_content').not(".hidden textarea").unbind('keydown').keydown(function(event) {
    if (event.keyCode == 13) {
        $('[data-send="message"]').click();
        $('[data-textarea="message"]').val(" ")
        return false;
     }
  });
}

