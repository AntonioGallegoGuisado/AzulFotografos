class PresentacionsController < ApplicationController
  def index
    @presentacion=Array.new
    presentacion=Presentacion.order('Presentacions.posicion').all
    fotos=Foto.all
    for foto in presentacion
      imagen=fotos.find(foto.foto_id)
      @presentacion << imagen
      #@presentacion << foto.Foto.image.url(:large).where(foto.Foto.id=foto.foto_id)
    end
    
  end
end
