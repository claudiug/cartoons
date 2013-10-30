
class CommentsMailer < ActionMailer::Base
  default from: "from@example.com"

  def comments_receive(comment)
    @comment  = comment

    mail to: "claudiu.garba@gmail.com", subject: "a new comment!"

  end
end
