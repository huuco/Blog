$('#form-comment-<%= @comment.id %>').append("<%= j render(@comment) %>");
$('#form-comment form textarea').val('');
