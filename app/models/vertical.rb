class Vertical < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :categories, dependent: :destroy
  accepts_nested_attributes_for :categories, allow_destroy: true

  validate :name_must_be_unique_across_models

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name, analyzer: 'english', index_options: 'offsets'
    end
  end

  def as_indexed_json(options={})
    as_json(only: [:name], include: { categories: { only: [:name], include: { courses: { only: [:name] } } } })
  end

  private

  def name_must_be_unique_across_models
    if Vertical.where.not(id: id).exists?(name: name) || Category.exists?(name: name)
      errors.add(:name, "#{name} is already taken in Category")
    end
  end
end
