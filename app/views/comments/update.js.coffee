<% if @comment.errors.blank? %>
$(".edit-comment-<%= @comment.id %>").replaceWith("<%= j render 'comments/comment', comment: @comment %>");
<% end %>
