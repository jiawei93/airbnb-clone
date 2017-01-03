class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  paginates_per 10
  mount_uploaders :photos, AvatarUploader

end
