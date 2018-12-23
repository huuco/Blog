$("#add-comment").remove();
$(".edit_comment-<%= @comment.id %>").html("<%= j render 'comments/edit_form_comment', post: @post, comment: @comment %>");
