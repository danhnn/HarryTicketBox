class AddQuantityRemainToTicketTypes < ActiveRecord::Migration
  def change
    add_column :ticket_types, :quantity_remain, :integer
  end
end
