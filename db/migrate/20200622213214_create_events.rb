class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.datetime :date
      t.string :location
      t.references :creator, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
    add_index :events, :name
  end
end
