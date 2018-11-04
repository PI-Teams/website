jQuery(document).on 'turbolinks:load', ->
  comments = $('#comments')
  if comments.length > 0
    App.global_chat = App.cable.subscriptions.create {
      channel: "BlogsChannel"
      blog_id: comments.data('blog-id')
    },
    connected: ->
    disconnected: ->
    received: (data) ->
      if data.action != '#remove_comment'
        comments.prepend data['comment']
      else
        id = data['comment_id']
        card_id = '#' + id
        $(card_id).remove()
    send_comment: (comment, blog_id) ->
      @perform 'send_comment', comment: comment, blog_id: blog_id
    remove_comment: (comment_id) ->
      @perform 'remove_comment', comment_id: comment_id
  $('#new_comment').submit (e) ->
    $this = $(this)
    textarea = $this.find('#comment_content')
    if $.trim(textarea.val()).length > 1
      App.global_chat.send_comment textarea.val(),
      comments.data('blog-id')
      textarea.val('')
    e.preventDefault()
    return false
  $('#comments').on "click", '.remove-comment', (e) ->
    $this = $(this)
    comment_id = $this.attr('data-comment-id')
    App.global_chat.remove_comment comment_id
    comments.data('blog-id')
    e.preventDefault()
    return false




    