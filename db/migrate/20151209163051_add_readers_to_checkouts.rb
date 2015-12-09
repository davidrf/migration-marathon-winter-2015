class AddReadersToCheckouts < ActiveRecord::Migration

  def up
    add_column :checkouts, :reader_id, :integer
    reader = Reader.first
    Checkout.all.each do |checkout|
      checkout.reader = reader
      checkout.save
    end
    change_column :checkouts, :reader_id, :integer, null: false
  end

  def down
    remove_column :checkouts, :reader_id
  end
end
