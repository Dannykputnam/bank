class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.float :amt
      t.boolean :deposit
      t.belongs_to :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
