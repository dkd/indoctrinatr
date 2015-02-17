class DocumentSubmissionsController < ApplicationController
  before_action :set_template, only: [:with_defaults, :new]
  before_action :set_document_submission, only: [:show, :edit, :update, :destroy]

  # GET /document_submissions
  def index
    @document_submissions = DocumentSubmission.all.recent_first.page params[:page]
  end

  def show # rubocop:disable Metrics/AbcSize
    @document_submission = DocumentSubmission.find params[:id]
    @submitted_values = @document_submission.submitted_values
    if params[:debug].present? && params[:debug] == 'true'
      render text: ERB.new(@submitted_values, nil, '-').result(@submitted_values.retrieve_binding), content_type: 'text/plain'
      return
    end

    tex_template = ERBRendering.new(@document_submission.content, @submitted_values.retrieve_binding).call
    pdf = TexRendering.new(tex_template).call

    send_data pdf, filename: @submitted_values.customized_output_file_name
  end

  # POST /document_submissions/with_defaults
  def with_defaults
    @document_submission = DocumentSubmissionBuilder.build_with_defaults @template

    if @document_submission.save
      redirect_to document_submission_url(@document_submission, format: :pdf)
    else
      render action: 'new'
    end
  end

  # GET /document_submissions/new
  def new
    @document_submission = DocumentSubmissionBuilder.build_from_template @template
  end

  # POST /document_submissions
  def create
    @document_submission = DocumentSubmissionBuilder.build_from_params document_submission_params

    if @document_submission.save
      redirect_to document_submission_url(@document_submission, format: :pdf)
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

  def set_template
    @template = Template.find params[:template_id]
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_document_submission
    @document_submission = DocumentSubmission.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def document_submission_params
    params.require(:document_submission).permit(:template_id, submitted_template_fields_attributes: [:id, :value, :template_field_id, :start_of_range, :end_of_range, :file_upload])
  end
end
