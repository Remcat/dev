class Client < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :copay, numericality: { only_integer: true }
  
  has_many :appointments
end
