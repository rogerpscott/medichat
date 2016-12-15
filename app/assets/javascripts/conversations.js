$(document).ready( function() {
  if ($('#kapor').text().length) {
    submitNewMessage();
  }

  $('body').off('click','#btnSendMessage');
  $('body').on("click","#btnSendMessage",function(event){
    event.preventDefault();
    if ($('#kapor').text().length) {
      $('[data-send="message"]').click();
      $('[data-textarea="message"]').val(" ")
    }
  });
  
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

