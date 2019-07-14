$(function() {
  $('.memo-show').click(function(){
    $('#memo-modal').fadeIn(300);
  });


  $('.close-modal').click(function() {
      $('#memo-modal').fadeOut();
  });
});
