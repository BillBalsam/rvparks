class Place < ApplicationRecord
  belongs_to :placeable, polymorphic: true

  validates :park_name, presence: true, length: { minimum: 3}
  validates :address, presence: true
  validates :zip_code, presence: true
  
  
end
