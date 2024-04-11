class Category < ApplicationRecord

  has_many :courses, dependent: :destroy
  belongs_to :vertical
  accepts_nested_attributes_for :courses, allow_destroy: true

  validate :name_must_be_unique_across_models

  private

  def name_must_be_unique_across_models
    if Category.where.not(id: id).exists?(name: name) || Vertical.exists?(name: name)
      errors.add(:name, "#{name} is already taken in Vertcial")
    end
  end
end
