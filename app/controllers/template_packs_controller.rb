class TemplatePacksController < ApplicationController
  def new
    @template = Template.new
    @template_pack = TemplatePack.new
  end

  def create
    processor = TemplatePackProcessor.new(template_pack_params)
    result = processor.run
    @template = processor.template
    @template_pack = processor.template_pack

    if result
      redirect_to templates_path, notice: 'Template was successfully created out of suppplied template pack.'
    else
      render action: 'new'
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def template_pack_params
    params.require(:template_pack).permit(:zip_container)
  end
end
