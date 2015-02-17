class TeXRendering
  def initialize tex_template
    @tex_template = tex_template
  end

  def call
    LatexToPdf.generate_pdf(@tex_template, command: 'xelatex', parse_twice: true)
  rescue ScriptError, StandardError => e
    raise TeXRenderingError, e.message
  end
end
