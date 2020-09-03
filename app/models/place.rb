class Place < ApplicationRecord
  

  validates :park_name, presence: true, length: { minimum: 3}
  validates :address, presence: true
  validates :zip_code, presence: true
  
  #belongs_to :host
end
