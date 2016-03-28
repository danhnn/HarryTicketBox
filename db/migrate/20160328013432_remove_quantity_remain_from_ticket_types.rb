class RemoveQuantityRemainFromTicketTypes < ActiveRecord::Migration
  def change
    remove_column :ticket_types, :quantity_remain, :integer
  end
end
