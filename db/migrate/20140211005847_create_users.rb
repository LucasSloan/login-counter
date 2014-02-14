class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :Username
      t.string :Password
      t.integer :count

      t.timestamps
    end
  end
end
