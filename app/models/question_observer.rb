class QuestionObserver < ActiveRecord::Observer
  def after_create(question)
    @user = User.find_by_id(question.user_id)
    question.logger.info('Question'+ question.id + 'submitted by ' + @user.email + '.')
  end
  def after_create(question)
    @user = User.find_by_id(question.user_id)
    question.logger.info('Question'+ question.id + 'submitted by ' + @user.email + '.')
  end
end
