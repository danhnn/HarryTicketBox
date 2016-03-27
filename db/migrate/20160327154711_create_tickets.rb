class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :ticket_type_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
