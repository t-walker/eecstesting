class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_initialize :default_values
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :usertests, dependent: :destroy
  has_many :responses, through: :usertests
  has_many :questions
  
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :studentid, presence: true, length: { is: 8 }, uniqueness: true

  def default_values
    self.role ||= 'student'
  end

  def admin?
    if role == "admin"
      true
    else
      false
    end
  end

  def self.to_csv
     attributes = %w{studentid email name }

     CSV.generate(headers: true) do |csv|
       csv << attributes
       all.each do |user|
         csv << attributes.map{ |attr| user.send(attr) }
       end
     end
   end

  def name
    "#{firstname} #{lastname}"
  end
end
