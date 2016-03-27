class TicketType < ActiveRecord::Base
  belongs_to :event

  before_create :check_duplicates

  def check_duplicates
  	if TicketType.exists?(event: event, price: price)
  		errors.add(:base, "Cannot have duplicates")
  	end
  end

end
