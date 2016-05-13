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
  end
end
