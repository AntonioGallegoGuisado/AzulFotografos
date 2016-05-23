class CategoriesController < ApplicationController
  def index
    
    #TODO: las categorias mostraran 1 sola foto y el nombre de la categoria encima
    
    #obtenemos las categorias visibles y las ordenamos
    @categorias=Category.order('Categories.posicion').where(:visible => true)
    
    #TODO: enlaces en la vista y en el header
     
  end
end
