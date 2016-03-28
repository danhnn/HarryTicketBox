class Ticket < ActiveRecord::Base
	belongs_to :user
	belongs_to :ticket_type

	def custom_save
		ticket_type.max_quantity = ticket_type.max_quantity - quantity
		if ticket_type.save
			save
			true
		else
			false
		end
	end

end
