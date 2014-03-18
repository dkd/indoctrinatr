class SubmittedTemplateFieldsController < ApplicationController
  before_action :set_submitted_template_field, only: [:show, :edit, :update, :destroy]

  # GET /submitted_template_fields
  def index
    @submitted_template_fields = SubmittedTemplateField.all
  end

  # GET /submitted_template_fields/1
  def show
  end

  # GET /submitted_template_fields/new
  def new
    @submitted_template_field = SubmittedTemplateField.new
  end

  # GET /submitted_template_fields/1/edit
  def edit
  end

  # POST /submitted_template_fields
  def create
    @submitted_template_field = SubmittedTemplateField.new(submitted_template_field_params)

    if @submitted_template_field.save
      redirect_to @submitted_template_field, notice: 'Submitted template field was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /submitted_template_fields/1
  def update
    if @submitted_template_field.update(submitted_template_field_params)
      redirect_to @submitted_template_field, notice: 'Submitted template field was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /submitted_template_fields/1
  def destroy
    @submitted_template_field.destroy
    redirect_to submitted_template_fields_url, notice: 'Submitted template field was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submitted_template_field
      @submitted_template_field = SubmittedTemplateField.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def submitted_template_field_params
      params.require(:submitted_template_field).permit(:document_submission_id, :template_field_id, :value)
    end
end
