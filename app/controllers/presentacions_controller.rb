class PresentacionsController < ApplicationController
  def index
    @presentacion=Array.new
    presentacion=Presentacion.order('Presentacions.posicion').all
    fotos=Foto.all
    for foto in presentacion
      imagen=fotos.find(foto.foto_id)
      @presentacion << imagen
    end
    @portada=@presentacion.shift
  end
end
