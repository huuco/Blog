$(document).on "click", ".cancel-comment-link", (e) ->
  e.preventDefault()
  replied = $(this).data("reply")
  $comment = $(this).closest('form')
  $restore_link = $comment.find("a.delete-comment-link")[0]
  if replied is true
    $reply_link = $comment.find("a.reply-comment-lnk")[0]
    