class Vertical < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :categories, dependent: :destroy
  accepts_nested_attributes_for :categories, allow_destroy: true

  validates :name, presence: true, uniqueness: true
  validate :name_must_be_unique_across_models

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name, analyzer: 'english', index_options: 'offsets'
    end
  end

  def name_must_be_unique_across_models
    if Category.exists?(name: name) || Vertical.exists?(name: name)
      errors.add(:name, "#{name} is already taken")
    end
  end

  def as_indexed_json(options={})
    as_json(only: [:name], include: { categories: { only: [:name], include: { courses: { only: [:name] } } } })
  end
end
