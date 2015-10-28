class Testversion < ActiveRecord::Base
  has_and_belongs_to_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions
  has_many :usertests, dependent: :destroy
  validates_uniqueness_of :isopen, if: :isopen

  validates :title, presence: true
  validates :startdate, presence: true
  validates :enddate, presence: true

  def is_open?
    isopen
  end

  def self.current
    Testversion.where(isopen: true).take
  end

end
