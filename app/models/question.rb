class Question < ActiveRecord::Base
  has_and_belongs_to_many :testversions, dependent: :destroy
end
