$("#btn-like-<%= @post.id %>").html("<%= j render partial: "likes/like", locals: {post: @post} %>");
