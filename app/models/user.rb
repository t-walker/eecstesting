class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :usertests
  has_many :responses, through: :usertests

  def admin?
    if role == "admin"
      true
    else
      false
    end
  end
end
