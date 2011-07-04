class CreateVcards < ActiveRecord::Migration
  def self.up
    create_table :vcards do |t|
      t.string :fn
      t.string :n
      t.string :org
      t.string :street_address
      t.string :postal_code
      t.string :locality
      t.string :tel
      t.string :fax
      t.string :email
      t.string :url
      
      t.integer :page_id

      t.timestamps
    end
    
    add_index :vcards, :page_id
  end

  def self.down
    drop_table :vcards
  end
end
