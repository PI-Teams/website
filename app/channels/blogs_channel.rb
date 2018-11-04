class BlogsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "blogs_#{params['blog_id']}_channel"
  end

  def unsubscribed
  end

  def send_comment(data)
    current_user.comments.create!(content: data['comment'], blog_id: data['blog_id'])
  end

  def remove_comment(data)
     comment = Comment.find(data['comment_id'])
     comment.destroy
     ActionCable.server.broadcast("blogs_#{params['blog_id']}_channel", {action: '#remove_comment', comment_id: data['comment_id'] })  
  end

end