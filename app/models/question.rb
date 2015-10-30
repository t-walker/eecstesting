class Question < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :testversions, dependent: :destroy

  def used?
    responses = Response.where(question_id: id)
    if responses.size > 0
      return false
    else
      true
    end
  end
end
