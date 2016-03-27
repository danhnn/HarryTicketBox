class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def venue_name
  	venue ? venue.name : nil 
  end

  def self.upcoming
  	where("ends_at >= ?",Time.zone.now.beginning_of_day)
    #where('extract(year from ends_at) = ?', 2016)
    #where("ends_at >= TIMESTAMP 'now'")
  end
end
