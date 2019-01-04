$("#btn-like-<%= @post.id %>").html("<%= j render partial: "likes/unlike", locals: {post: @post} %>");
