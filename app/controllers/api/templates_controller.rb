require 'erb'

module Api
  class TemplatesController < ApplicationController
    AUTH_KEY     = 'tNDF6kiuAiJcAdr2SX'
    SECURE_TOKEN = 'KnOEWFGwNiMEl7kmNZGOSO3XAhKjzZTHJShHlhbC'

    before_action :authenticate_app

    def generate
      @template = Template.find params[:id]
      @template.initialize_attributes params
      if params[:raw].present?
        render text: ERB.new(@template.tex_template, nil, '-').result(@template.retrieve_binding), content_type: 'text/plain'
      else
        render layout: 'application', formats: [:pdf]
      end
    rescue ActionView::Template::Error => e
      Honeybadger.notify(e)
      @template.update_attributes(error_log: File.read(e.message.match(%r{[\./\w-]+.log}).first))
      if params[:backend]
        redirect_to last_error_document_type_path(@template)
      else
        redirect_to error_log_api_document_type_path(@template, auth_key: AUTH_KEY, secure_token: SECURE_TOKEN)
      end
    end

    def error_log
      @template = DocumentType.find params[:id]
      render text: @template.error_log
    end

    private

    def authenticate_app
      head :forbidden unless params[:auth_key] == AUTH_KEY && params[:secure_token] == SECURE_TOKEN
    end
  end
end
