class Category < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :courses, dependent: :destroy
  belongs_to :vertical
  accepts_nested_attributes_for :courses, allow_destroy: true

  validate :name_must_be_unique_across_models
  validates :name, presence: true, uniqueness: true

  private

  def name_must_be_unique_across_models
    if Category.exists?(name: name) || Vertical.exists?(name: name)
      errors.add(:name, "#{name} is already taken")
    end
  end
end
