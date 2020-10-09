class Place < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :placeable, polymorphic: true
  has_many :photos

  validates :park_name, presence: true, length: { minimum: 3}
  validates :address, presence: true
  validates :zip_code, presence: true
  validates :phone, presence: true
  
  
end
