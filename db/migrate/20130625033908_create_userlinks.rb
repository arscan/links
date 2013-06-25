class CreateUserlinks < ActiveRecord::Migration
  def change
    create_table :userlinks do |t|
      t.string :name
      t.string :url
      t.string :shorturl

      t.timestamps
    end
  end
end
