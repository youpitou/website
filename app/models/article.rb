class Article < ActiveRecord::Base
  
  validates_presence_of :title
  validates_presence_of :content
  
  has_many :comments, :dependent => :destroy
  
end
