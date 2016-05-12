class Foto < ActiveRecord::Base
  belongs_to :galery
  
   has_attached_file :image, styles: { small: "640x640", med: "1000x1000", large: "2000x2000" }
   validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  def to_s
    self.titulo
  end
  
end
