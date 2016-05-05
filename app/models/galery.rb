class Galery < ActiveRecord::Base
  belongs_to :category
  
  def to_s
    self.titulo
  end
  
end
