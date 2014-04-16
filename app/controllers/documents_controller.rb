class DocumentsController < ApplicationController
  # GET /documents/1
  def show
    @document = Document.find(params[:id])
  end
end
