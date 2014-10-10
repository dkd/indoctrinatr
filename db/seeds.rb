seed_template_pack = File.join(Rails.root, 'db', 'seed_data', 'certificate.zip')
TemplatePack.create!(zip_container: File.new(seed_template_pack, 'r'))
