$(document).ready( function() {
  if ($('#kapor').text().length) {
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

