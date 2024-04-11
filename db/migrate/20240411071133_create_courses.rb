class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :author
      t.string :state
      t.references :category,     null: false,      index: true

      t.timestamps
    end
  end
end
