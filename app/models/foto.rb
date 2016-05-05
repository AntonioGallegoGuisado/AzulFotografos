class Foto < ActiveRecord::Base
  belongs_to :galery
  
   has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  
  def to_s
    self.titulo
  end
  
end
