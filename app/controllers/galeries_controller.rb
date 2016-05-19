class GaleriesController < ApplicationController
  
  def index
    
    @galerias=Array.new
    #Filtramos galerias por visibles
    galerias=Galery.order('Galeries.posicion').where(:visible => true)
    
    #Por cada registro (llamado gal) en galerias:    
    for gal in galerias
      #obtenemos titulo y descripcion
      titulo=gal.titulo
      descripcion=gal.descripcion
      #preparamos nuestro objeto galeria
      galeria=Array.new
      rutaGaleria="galeria/#{gal.id}"
      galeria << rutaGaleria
      #Obtenemos todas las fotos relacionadas con la galeria
      #filtramos por visibles las fotos
      #limitamos cantidad de fotos por galeria a 3
      fotos=Foto.order('Fotos.posicion').where(:galery_id => gal.id).where(:visible => true).limit(3)
      for foto in fotos
        #introducimos cada foto como un objeto independiente en un array galeria
        galeria << foto
        
      end
      #introducimos cada array galeria como un objeto independiente en la variable de la vista
      #introducimos tambien su titulo y descripcion
      #enlazamos cada galeria con la vista de cada galeria
      ruta=galeria.shift
      @galerias << [galeria,titulo,descripcion,ruta]
    end
    
  end
  
  def galeria
    
  end
  
end