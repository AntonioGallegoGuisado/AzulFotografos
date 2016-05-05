class Category < ActiveRecord::Base
  
  def to_s
    self.titulo
  end
  
end
