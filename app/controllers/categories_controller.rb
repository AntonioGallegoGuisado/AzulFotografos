class CategoriesController < ApplicationController
  def index
    
    #obtenemos las categorias visibles y las ordenamos
    @categorias=Category.order('Categories.posicion').where(:visible => true)
     
  end
end
