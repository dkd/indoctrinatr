class DocumentSubmissionsController < ApplicationController
  before_action :set_document_submission, only: [:edit, :update, :destroy]

  # GET /document_submissions
  def index
    @document_submissions = DocumentSubmission.all.page params[:page]
  end

  # POST /document_submissions/with_defaults
  def with_defaults
    @document_submission = DocumentSubmissionBuilder.build_with_defaults params[:template_id]

    if @document_submission.save
      redirect_to document_submissions_url, notice: 'Document submission was successfully created.'
    else
      render action: 'new'
    end
  end

  # GET /document_submissions/new
  def new
    @document_submission = DocumentSubmissionBuilder.build_from_template params[:template_id]
  end

  # POST /document_submissions
  def create
    @document_submission = DocumentSubmissionBuilder.build_from_params document_submission_params

    if @document_submission.save
      redirect_to document_submissions_url, notice: 'Document submission was successfully created.'
    else
      render action: 'new'
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
    params.require(:document_submission).permit(:template_id, submitted_template_fields_attributes: [:id, :value, :template_field_id, :end_of_range])
  end
end
