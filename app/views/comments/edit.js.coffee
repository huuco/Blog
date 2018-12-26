$(".edit-comment").remove();
$(".edit-comment-<%= @comment.id %>").append("<%= j render 'comments/edit_form_comment', post: @post, comment: @comment %>");
