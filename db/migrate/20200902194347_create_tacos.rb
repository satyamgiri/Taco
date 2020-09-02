class CreateTacos < ActiveRecord::Migration[6.0]
  def change
    create_table :tacos do |t|
      t.integer :meat, default: 0, null: false
      t.boolean :rice, default: false
      t.boolean :salsa, default: false
      t.boolean :guacamole, default: false
      t.text :notes

      t.timestamps
    end
  end
end
