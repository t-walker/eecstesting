class Testversion < ActiveRecord::Base
  has_and_belongs_to_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions
  has_many :usertests, dependent: :destroy
  validates :title, presence: true
  validates :startdate, presence: true
  validates :enddate, presence: true

  scope :active, ->{where(:isopen => true)}

  def self.active_tests?
    if Testversion.active.size > 1
      return true
    else
      return false
    end
  end

  def open?
    if isopen && startdate <= Date.today && Date.today <= enddate
      true
    else
      false
    end
  end

  def self.current
    Testversion.where(isopen: true).take
  end

end
