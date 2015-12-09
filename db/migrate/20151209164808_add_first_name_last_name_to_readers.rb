class AddFirstNameLastNameToReaders < ActiveRecord::Migration
  def up
    add_column :readers, :first_name, :string
    add_column :readers, :last_name, :string

    Reader.all.each do |reader|
      first_name = reader.name.split[0]
      last_name = reader.name.split[1]
      reader.first_name = first_name
      reader.last_name = last_name
      reader.save
    end

    change_column :readers, :first_name, :string, null: false
    change_column :readers, :last_name, :string, null: false
    remove_column :readers, :name
  end

  def down
    add_column :readers, :name, :string
    Reader.all.each do |reader|
      name = "#{reader.first_name} #{reader.last_name}"
      reader.name = name
      reader.save
    end
    change_column :readers, :name, :string, null: false
    remove_column :readers, :first_name
    remove_column :readers, :last_name
  end

end
