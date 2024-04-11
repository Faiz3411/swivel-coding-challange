class Category < ApplicationRecord

  has_many :courses, dependent: :destroy
  belongs_to :vertical
  accepts_nested_attributes_for :courses, allow_destroy: true
end
