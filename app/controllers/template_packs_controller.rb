class TemplatePacksController < ApplicationController
  def new
    @template = Template.new
    @template_pack = TemplatePack.new
  end

  def create
    @template_pack = TemplatePack.create! template_pack_params
    processor = TemplatePackProcessor.new(@template_pack)
    result = processor.run
    @template = processor.template

    if result
      redirect_to templates_path, notice: 'Template was successfully created out of suppplied template pack.'
    else
      render action: 'new'
    end
  end

  def show
    @template_pack = TemplatePack.find params[:id]
    send_file @template_pack.zip_container.path
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def template_pack_params
    params.require(:template_pack).permit(:zip_container)
  end
end
