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
      #Obtenemos todas las fotos relacionadas con la galeria
      #filtramos por visibles las fotos
      fotos=Foto.order('Fotos.posicion').where(:galery_id => gal.id).where(:visible => true)
      for foto in fotos
        #introducimos cada foto como un objeto independiente en un array galeria
        #TODO: limitar cantidad de fotos por galeria
        galeria << foto
        #TODO: crear los textos alternativos de cada foto
        #TODO: enlazar cada foto con su enlace al controlador de fotos
      end
      #introducimos cada array galeria como un objeto independiente en la variable de la vista
      #introducimos tambien su titulo y descripcion
      #TODO: enlazar cada galeria con la vista de cada galeria y hacer la vista
      @galerias << [galeria,titulo,descripcion]
    end
    
  end
end