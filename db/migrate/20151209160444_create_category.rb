class CreateCategory < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false, unique: true
    end
  end
end
