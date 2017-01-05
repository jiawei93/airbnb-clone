class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  paginates_per 10
  mount_uploaders :photos, AvatarUploader
  # scope :main_search, -> (keyword) {where(["lower(keyword) like ?", "#{title.downcase}" OR "#{description.downcase}"])}
  # scope :
  scope :main_search, -> (keyword) {where(['lower(title) != ? OR lower(description) != ?', "#{keyword.downcase}", "#{keyword.downcase}"])}

end
