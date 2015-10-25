class Testversion < ActiveRecord::Base
  has_and_belongs_to_many :questions
  has_many :usertests

  def is_open?
    isopen
  end

  def self.current
    Testversion.where(isopen: true).take
  end
end
