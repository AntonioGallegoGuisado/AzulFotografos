class Foto < ActiveRecord::Base
  belongs_to :galery
  
   has_attached_file :image, styles: { small: "64x64", med: "300x300", large: "500x500" }
   validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  def to_s
    self.titulo
  end
  
end
