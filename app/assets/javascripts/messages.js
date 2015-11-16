$( document ).ready(function() {
  $(".unread").each(function() {
    var that = $(this);
    var messageId = that.data("message-id");
    $.ajax({
      url: '/messages/'+messageId,
      type: 'PUT',
      success: function(){
        that.attr('class', 'read');
        that.val('read');
      }
    });
  });  
});
