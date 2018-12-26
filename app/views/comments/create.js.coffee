<% if @comment.present? %>
  $(".comment-list").prepend("<%= j render partial: 'comments/comment', locals: {comment: @comment} %>");
  $("#comment_list").val("");
<% else %>
  alert(I18n.t("flash.please_login"));
<% end %>

