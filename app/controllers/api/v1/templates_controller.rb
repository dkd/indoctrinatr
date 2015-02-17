require 'erb'

module Api
  module V1
    class TemplatesController < ApplicationController
      INDOCTRINATR_AUTH_KEY     = Rails.application.secrets.fetch(:indoctrinatr_auth_key)
      INDOCTRINATR_SECURE_TOKEN = Rails.application.secrets.fetch(:indoctrinatr_secure_token)

      protect_from_forgery with: :null_session

      before_action :authenticate_api
      skip_before_action :set_locale

      def generate # rubocop:disable Metrics/AbcSize
        @template = Template.find params[:id]
        @document_submission = DocumentSubmissionBuilder.build_via_api @template, params
        @submitted_values = @document_submission.submitted_values
        tex_template = ERBRendering.new(@document_submission.content, @submitted_values.retrieve_binding).call

        if params[:debug].present? && params[:debug] == 'true'
          render text: tex_template, content_type: 'text/plain' and return
        end

        pdf = TexRendering.new(tex_template).call
        send_data pdf, filename: @submitted_values.customized_output_file_name
      end

      private

      def authenticate_api
        head :forbidden unless [params[:auth_key], params[:secure_token]] == [INDOCTRINATR_AUTH_KEY, INDOCTRINATR_SECURE_TOKEN]
      end
    end
  end
end
