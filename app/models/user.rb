class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :usertests
  has_many :responses, through: :usertests

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :studentid, presence: true, length: { is: 8 }, uniqueness: true

  def admin?
    if role == "admin"
      true
    else
      false
    end
  end
  
  def self.as_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end

end
