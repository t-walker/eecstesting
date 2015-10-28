class QuestionObserver < ActiveRecord::Observer
  observe :question
  def after_create(question)
    @user = User.find_by_id(question.user_id)
    Notification.create(user_id: @user.id, model: "question", notification: "created", model_id: question.id)
  end
end
