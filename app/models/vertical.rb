class Vertical < ApplicationRecord

  has_many :categories, dependent: :destroy
  accepts_nested_attributes_for :categories, allow_destroy: true

  validate :name_must_be_unique_across_models

  private

  def name_must_be_unique_across_models
    if Vertical.where.not(id: id).exists?(name: name) || Category.exists?(name: name)
      errors.add(:name, "#{name} is already taken in Category")
    end
  end
end
