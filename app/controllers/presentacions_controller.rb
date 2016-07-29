class PresentacionsController < ApplicationController
  def index
    
    if Presentacion.exists?
      @presentacion=Array.new
      presentacion=Presentacion.order('Presentacions.posicion').all
      fotos=Foto.all
      for foto in presentacion
        imagen=fotos.find(foto.foto_id)
        @presentacion << imagen
      end
      @portada=@presentacion.shift
    end
    
    #Parrafo de introducción editable
    if Intro.exists?
      @intro=Intro.first.introduccion
    end
    
    #Modulo novedades flotante a la derecha / abajo si no cabe, con texto y enlace a la novedad
    #seleccionar las ultimas novedades (limite 5)
    @novedades=Novedad.last(5)
    @novedades=@novedades.reverse
  end
end
