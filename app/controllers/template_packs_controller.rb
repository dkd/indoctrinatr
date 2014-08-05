class TemplatePacksController < ApplicationController

  def new
    @template_pack = TemplatePack.new
  end

  def create
    @template_pack = TemplatePack.new(template_pack_params)
    if @template_pack.save!
      redirect_to templates_path, notice: "Template was successfully created out of suppplied template-pack"
    else
      render action: "new"
    end
  end

  def show
  end

  def index
  end

  def destroy
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def template_pack_params
    params.require(:template_pack).permit(:zip_container)
  end

end