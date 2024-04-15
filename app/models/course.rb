class Course < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :category
end
