class Category < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_one_attached :avatar



  validates_presence_of :name , :description, :avatar 

  has_many :missions 

  def image_url
    #Get the URL of the associated image
    avatar.attached? ? url_for(avatar) : nil
  end
end
