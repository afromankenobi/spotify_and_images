# Song model to save songs selected from the search
class Song < ActiveRecord::Base
  # some validations
  validates_presence_of :name, :artist, :popularity
  has_many :images

  accepts_nested_attributes_for :images, allow_destroy: true
end
