class SubmittedValues
  def initialize template_asset_path, output_file_name, submitted_template_fields # rubocop:disable Metrics/AbcSize
    @_template_asset_path = template_asset_path
    @_output_file_name = output_file_name

    submitted_template_fields.each do |submitted_template_field|
      instance_variable_set("@_#{submitted_template_field.name}", submitted_template_field.value_or_default)

      define_singleton_method "raw_#{submitted_template_field.name}".to_sym do
        instance_variable_get("@_#{submitted_template_field.name}")
      end

      define_singleton_method submitted_template_field.name.to_sym do
        instance_variable_get("@_#{submitted_template_field.name}").to_latex
      end
    end
  end

  def retrieve_binding
    binding
  end

  def textile2latex textile
    RedCloth.new(textile).to_latex
  end

  def template_asset_path
    @_template_asset_path
  end

  def customized_output_file_name
    @_customized_output_file_name ||= eval('"' + @_output_file_name + '"') # rubocop:disable Lint/Eval
  end
end
