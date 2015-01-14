require 'zip'

class TemplatePackProcessor
  attr_reader :template_pack, :template

  def initialize template_pack
    @template_pack = template_pack
  end

  def run
    unzip_container
    process_configuration_file
    extract_tex_template
    extract_template_fields
    create_template_and_template_attributes
    save_template
  end

  private

  def unzip_container
    Zip::File.open @template_pack.zip_container.path do |zip_file|
      zip_file.each do |file|
        file_path = File.join @template_pack.path_for_extraction, file.name
        FileUtils.mkdir_p File.dirname(file_path)
        zip_file.extract file, file_path unless File.exist? file_path
      end
    end
  end

  def process_configuration_file
    config_file_content = File.read @template_pack.path_to_config_file
    @template_config = YAML.load config_file_content
    @template_name = @template_config.fetch 'template_name', @template_name
    @output_file_name = @template_config.fetch 'output_file_name', "#{@template_name}.pdf"
  end

  def extract_tex_template
    @template_content = File.read @template_pack.path_to_template_file
  end

  def extract_template_fields
    @template_fields_attributes = @template_config.fetch 'fields', []
  end

  def create_template_and_template_attributes
    @template = Template.new do |template|
      template.name = @template_name
      template.template_asset_path = File.join(@template_pack.path_to_extracted_container, 'assets')
      template.output_file_name = @output_file_name
      template.content = @template_content
      template.template_pack = @template_pack
      template.template_fields_attributes = @template_fields_attributes
    end
  end

  def save_template
    @template.save!
  end
end
