<% if @comment.errors.blank? %>
$("#comment-<%= @comment.id %>").replaceWith("<%= j render 'comments/comment', comment: @comment %>");
<% end %>
