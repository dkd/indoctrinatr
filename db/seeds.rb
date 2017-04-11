seed_template_pack = Rails.root.join('db', 'seed_data', 'certificate.zip')
template_pack = TemplatePack.create!(zip_container: File.new(seed_template_pack, 'r'))

TemplatePackProcessor.new(template_pack).run
