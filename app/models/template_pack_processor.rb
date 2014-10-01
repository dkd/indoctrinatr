class TemplatePackProcessor
  def initialize template_pack
    @template_pack = template_pack
  end

  def run
    unzip_container
    process_configuration_file
    extract_tex_template
    extract_template_fields
    create_template_and_template_attributes
  end

  private

  def unzip_container
    Zip::File.open @template_pack.zip_container.path do |zip_file|
      zip_file.each do |file|
        file_path = File.join(@template_pack.path_for_extraction, file.name)
        FileUtils.mkdir_p File.dirname(file_path)
        zip_file.extract file, file_path unless File.exist? file_path
      end
    end
  end

  def process_configuration_file
    config_file_content = File.read @template_pack.path_to_config_file
    @template_config = YAML.load config_file_content
    @template_name = @template_config.fetch('template-name', '') # legacy
    @template_name = @template_config.fetch('template_name', @template_name)
  end

  def extract_tex_template
    @template_content = File.read @template_pack.path_to_template_file
  end

  def extract_template_fields
    @template_fields_attributes = @template_config.fetch('fields', [])
    # Legacy:
    # @template_fields_attributes.map! do |template_fields_attribute_hash|
    #   template_fields_attribute_hash[:presentation] = template_fields_attribute_hash.delete('data_type')
    #   template_fields_attribute_hash
    # end
  end

  def create_template_and_template_attributes
    @template = Template.create! do |template|
      template.name = @template_name
      template.asset_path = ''
      template.template_asset_path = @template_pack.path_to_extracted_container
      template.content = @template_content
      template.template_fields_attributes = @template_fields_attributes
      template.template_pack = @template_pack
      template.is_package = true
    end
  end
end
