class CreateVhs < ActiveRecord::Migration[6.1]
  def change
    create_table :vhs do |t|
      t.integer :serial_number

      t.timestamps
    end
  end
end
