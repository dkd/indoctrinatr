require 'erb'

module Api
  class TemplatesController < ApplicationController
    INDOCTRINATR_AUTH_KEY     = Rails.application.secrets.fetch(:indoctrinatr_auth_key)
    INDOCTRINATR_SECURE_TOKEN = Rails.application.secrets.fetch(:indoctrinatr_secure_token)

    protect_from_forgery with: :null_session

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

    private

    def authenticate_api
      head :forbidden unless [params[:auth_key], params[:secure_token]] == [INDOCTRINATR_AUTH_KEY, INDOCTRINATR_SECURE_TOKEN]
    end
  end
end
