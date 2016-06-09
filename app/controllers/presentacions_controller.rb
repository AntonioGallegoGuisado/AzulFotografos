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
    
    #Parrafo de introducción editable
    
    @intro=Intro.first.introduccion
    
    #Modulo novedades flotante a la derecha / abajo si no cabe, con texto y enlace a la novedad
    #seleccionar las ultimas novedades (limite 3)
    @novedades=Novedad.last(3)
    
  end
end
