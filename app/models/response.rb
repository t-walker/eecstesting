class Response < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :test, dependent: :destroy
end
