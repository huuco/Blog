  $(".comment-list").prepend("<%= j render partial: 'comments/comment', locals: {comment: @comment} %>");
  $("#comment_list").val("");
