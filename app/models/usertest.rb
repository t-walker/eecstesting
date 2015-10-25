class Usertest < ActiveRecord::Base
  belongs_to :user
  has_many :responses, dependent: :destroy
  accepts_nested_attributes_for :responses
  belongs_to :testversion

  def self.to_csv
     attributes = %w{date studentid score }

     CSV.generate(headers: true) do |csv|
       csv << attributes
       all.each do |user|
         csv << attributes.map{ |attr| user.send(attr) }
       end
     end
   end

   def date
     created_at.to_formatted_s(:db)
   end

   def studentid
     @user = User.find_by_id(user_id)
     @user.studentid
   end

end
