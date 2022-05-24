class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.text :explain, null: false 
      t.date :visit,   null: false
      t.references :user,       null: false ,foreign_key: true
      t.references :prefecture, null: false ,foreign_key: true
      t.timestamps
    end
  end
end
