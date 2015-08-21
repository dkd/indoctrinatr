Rails.application.config.after_initialize do
  require 'redcloth_latex_formatter_patch/patch'
end
