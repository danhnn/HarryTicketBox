class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :user
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}
  accepts_nested_attributes_for :ticket_types, allow_destroy: true

  def venue_name
  	venue ? venue.name : nil 
  end

  def self.upcoming(name)
    name = name.present? ? name : ""
  	where("ends_at >= ? and LOWER(name) LIKE ? and published=true",Time.zone.now.beginning_of_day,
      "%#{name.downcase}%")
  end

end
