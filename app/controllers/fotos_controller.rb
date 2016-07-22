class FotosController < ApplicationController
  
  def index()
    id=params[:id]
    fotos=Foto.all
    foto=fotos.find_by_id(id)
    if foto
      if foto.visible==true
        @foto=foto
      end
    end
    
    #entramos aqui solo si la foto actual es visible
    #controlar si la foto pertenece a una galeria
    if foto
      if foto.galery_id
        if foto.visible==true
          #obtener colección de fotos que pertenecen a la galeria
          #obtener id galeria
          idGal=foto.galery_id
          @idGal=idGal
          #filtrar fotos por id galeria y ordenar por posicion
          galeria=fotos.order('fotos.posicion').where(:galery_id => idGal).where(:visible => true).all
          #obtener array de IDs de la galeria a la que pertenece la foto ignorando las fotos ocultas
          idsFotos=Array.new
          for elemento in galeria
            idsFotos << elemento.id
          end
          #obtener la ID siguiente en el array
          pos=nil
          cont=1
          for elem in idsFotos
            if elem.to_i == params[:id].to_i
              pos=cont
            else
              cont=cont+1
            end
          end
          #controlar el tamaño del array
          tam=idsFotos.size
          if pos == tam
            @nextID=idsFotos[0]
          else
            @nextID=idsFotos[pos]
          end
          
          #obtener la ID de la foto anterior para crear un enlace a la foto
          anterior = pos-2
          
          #controlamos el tamaño del array
          arrayPos=tam-1
          
          #controlamos primera posicion del array
          if pos == 1
            @prevID=idsFotos[arrayPos]
          else
            @prevID=idsFotos[anterior]
          end
        end
      end
    end
  end
end
