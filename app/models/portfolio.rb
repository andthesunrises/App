class Portfolio < ApplicationRecord
  
  has_many  :technologies
  
  #inclue the little concern for placeholder image generator
  include Placeholder
  
  validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image  
  
  def self.angular
    where(subtitle: 'Angular')
  end
  
  scope :ruby_on_rails_portfolio_items, -> {where(subtitle: 'Ruby on Rails')}
  
  after_initialize :set_defaults
  
  #setting default values for each of the field, do not use =, but use ||=, it checks if empty first.
  # if self.main_image == nil
  # self.main_image = "whateveR"
  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
