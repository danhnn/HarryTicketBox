class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def venue_name
  	venue ? venue.name : nil 
  end

  def self.upcoming(name)
    name = name.present? ? name : ""
  	where("ends_at >= ? and LOWER(name) LIKE ?",Time.zone.now.beginning_of_day,"%#{name.downcase}%")
  end
end
