<% if @comment.errors.blank? %>
  $("#comment-<%= @comment.id %>").replaceWith("<%= j render 'comments/comment', comment: @comment %>");
  toastr.options.timeOut = <%= Settings.toastr_timeout %>;
  toastr.success("<%= "update success" %>");
<% end %>
