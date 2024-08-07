class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.references :user,           null: false, foreign_key: true
      t.references :work,           null: false, foreign_key: true
      t.string :negotiation,        null: false
      t.string :negotiation_obtain, null: false
      t.string :negotiation_lost,   null: false
      t.text :introspection,        null:false
      t.timestamps
    end
  end
end
