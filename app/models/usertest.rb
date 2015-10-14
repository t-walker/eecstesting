class Usertest < ActiveRecord::Base
  belongs_to :user
  has_many :responses, dependent: :destroy
  accepts_nested_attributes_for :responses

  def self.as_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end

end
