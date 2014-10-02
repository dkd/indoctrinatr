require 'erb'

module Api
  class TemplatesController < ApplicationController
    protect_from_forgery with: :null_session

    AUTH_KEY     = 'tNDF6kiuAiJcAdr2SX'
    SECURE_TOKEN = 'KnOEWFGwNiMEl7kmNZGOSO3XAhKjzZTHJShHlhbC'

    before_action :authenticate_api

    def generate
      @template = Template.find params[:id]
      @document_submission = DocumentSubmissionBuilder.build_via_api @template, params
      @document_submission.initialize_fields

      if params[:raw].present?
        render text: ERB.new(@document_submission.content, nil, '-').result(@document_submission.retrieve_binding), content_type: 'text/plain'
      else
        render layout: 'application', formats: [:pdf]
      end
    end

    # def error_log
    #   @template = DocumentType.find params[:id]
    #   render text: @template.error_log
    # end

    private

    def authenticate_api
      head :forbidden unless [params[:auth_key], params[:secure_token]] == [AUTH_KEY, SECURE_TOKEN]
    end
  end
end
