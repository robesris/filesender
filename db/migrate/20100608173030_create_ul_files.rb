class CreateUlFiles < ActiveRecord::Migration
  def self.up
    create_table :ul_files do |t|
      t.string :sender_name
      t.string :recipient_email
      t.string :filename

      t.timestamps
    end
  end

  def self.down
    drop_table :ul_files
  end
end
