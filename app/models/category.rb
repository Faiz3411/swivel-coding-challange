class Category < ApplicationRecord

  has_many :courses, dependent: :destroy
  belongs_to :vertical
end
