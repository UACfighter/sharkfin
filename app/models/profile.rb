class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :country, optional: true
end
