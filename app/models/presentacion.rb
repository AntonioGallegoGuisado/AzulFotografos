class Presentacion < ActiveRecord::Base
  belongs_to :foto
  validates_uniqueness_of :foto_id
end
