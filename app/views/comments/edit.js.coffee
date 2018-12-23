$("#add-comment").remove();
$(".edit_comment-<%= @comment.id %>").append("<%= j render 'comments/edit_form_comment', post: @post, comment: @comment %>");
