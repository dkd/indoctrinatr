class TemplatesController < ApplicationController
  before_action :set_template, only: [:document_submissions, :edit, :update, :destroy]

  # GET /templates
  # GET /templates.json
  def index
    @templates = Template.includes(:template_fields).search(params[:search]).page params[:page]
  end

  # GET /templates/new
  def new
    @template = Template.new
  end

  # GET /templates/1/edit
  def edit
  end

  # GET /templates/1/document_submission
  def document_submissions
    @document_submissions = @template.document_submissions.recent_first.page params[:page]
  end

  # POST /templates
  # POST /templates.json
  def create
    @template = Template.new(template_params)

    if @template.save
      redirect_to templates_url, notice: 'Template was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /templates/1
  # PATCH/PUT /templates/1.json
  def update
    if @template.update(template_params)
      redirect_to templates_url, notice: 'Template was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /templates/1
  # DELETE /templates/1.json
  def destroy
    @template.destroy
    redirect_to templates_url, notice: 'Template was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_template
    @template = Template.find params[:id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def template_params
    params.require(:template).permit(:name, :content, :textual_description, template_fields_attributes: [:id, :name, :label, :start_of_range, :end_of_range, :required, :default_value, :available_options, :presentation, :_destroy]) # rubocop:disable Metrics/LineLength
  end
end
