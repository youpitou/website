class Article < ActiveRecord::Base
  
  validates_presence_of :title, :content
  
  has_many :comments, :dependent => :destroy
  
end
