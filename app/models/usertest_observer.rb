class UsertestObserver < ActiveRecord::Observer
  def after_save(usertest)
    @user = User.find_by_id(usertest.user_id)
    usertest.logger.info('New test submitted by ' + @user.email + '.')
  end
end
