#encoding utf-8
class Friend < ActiveRecord::Base
  validates :latitude, :longitude, :uniqueness => true, :numericality =>  {:only_integer => true }
  validates :latitude, :longitude, :name, :presence => true

  attr_accessible :latitude, :longitude, :name
end
