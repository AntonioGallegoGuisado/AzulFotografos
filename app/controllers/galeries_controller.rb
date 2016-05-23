class GaleriesController < ApplicationController
  
  def index
    
    #preparamos la variable para la vista
    @galerias=Array.new
    
    #comprobamos si hemos recibido parametros de filtro
    if params[:id]
        
        #Obtenemos las galerias ordenadas y las filtramos por visibles y por id
        id=params[:id]
        galerias=Galery.order('Galeries.posicion').where(:visible => true).where(:category_id => id)
        
        #Por cada registro (llamado gal) en galerias:    
        for gal in galerias
          #obtenemos titulo y descripcion
          titulo=gal.titulo
          descripcion=gal.descripcion
          #preparamos nuestro objeto galeria
          galeria=Array.new
          rutaGaleria="/galeria/#{gal.id}"
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
        
    else
        #Obtenemos las galerias ordenadas y las filtramos por visibles
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
    
  end
  
  def galeria
    
    id=params[:id]
    @galeria=Array.new
    galeria=Array.new
    #consulta a base de datos
    galerias=Galery.where(:id => id).where(:visible => true).all
    #comprobamos que la galeria es visible
    if galerias != nil
      @galeria=Array.new
      #obtenemos las fotos ordenadas de la galeria y las filtramos por visibles
      fotos=Foto.order('Fotos.posicion').where(:galery_id => id).where(:visible => true).all
      for gal in galerias
        #obtenemos el titulo
        titulo=gal.titulo
        #obtenemos la descripcion
        descripcion=gal.descripcion
      end
      #insertamos los datos
      for foto in fotos
        galeria << foto
      end
      @galeria= [galeria,titulo,descripcion]
        
    end
    
  end
  
end