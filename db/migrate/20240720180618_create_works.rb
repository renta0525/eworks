class CreateWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :works do |t|
      t.references :user,           null: false, foreign_key: true
      t.string :place,              null: false
      t.timestamps
    end
  end
end
