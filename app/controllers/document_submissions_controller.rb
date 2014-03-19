class DocumentSubmissionsController < ApplicationController
  before_action :set_document_submission, only: [:show, :edit, :update, :destroy]

  # GET /document_submissions
  def index
    @document_submissions = DocumentSubmission.all
  end

  # GET /document_submissions/1
  def show
  end

  # GET /document_submissions/new
  def new
    @template = Template.find(params[:template_id]) 
    @document_submission = DocumentSubmissionBuilder.build_from_template @template
  end

  # GET /document_submissions/1/edit
  def edit
  end

  # POST /document_submissions
  def create
    @document_submission = DocumentSubmission.new(document_submission_params)

    if @document_submission.save
      redirect_to @document_submission, notice: 'Document submission was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /document_submissions/1
  def update
    if @document_submission.update(document_submission_params)
      redirect_to @document_submission, notice: 'Document submission was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /document_submissions/1
  def destroy
    @document_submission.destroy
    redirect_to document_submissions_url, notice: 'Document submission was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_submission
      @document_submission = DocumentSubmission.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def document_submission_params
      params.require(:document_submission).permit(:template_id, submitted_template_fields_attributes: [:id, :value, :template_field_id])
    end
end
