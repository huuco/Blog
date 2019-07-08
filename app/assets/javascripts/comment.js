(function() {
  $(document).on("click", ".cancel-comment-link", function(e) {
    var $comment, $reply_link, $restore_link, replied;
    e.preventDefault();
    replied = $(this).data("reply");
    $comment = $(this).closest('form');
    $restore_link = $comment.find("a.delete-comment-link")[0];
    if (replied === true) {
      return $reply_link = $comment.find("a.reply-comment-lnk")[0];
    }
  });

}).call(this);


//# sourceMappingURL=comment.js.map
//# sourceURL=coffeescript