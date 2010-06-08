class AddMd5ToUlFile < ActiveRecord::Migration
  def self.up
    add_column :ul_files, :md5, :string
  end

  def self.down
    remove_column :ul_files, :md5
  end
end
