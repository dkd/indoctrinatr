class ERBRendering
  def initialize erb_template, binding
    @erb_template = erb_template
    @binding = binding
  end

  def call
    ERB.new(@erb_template, nil, '-').result(@binding)
  rescue ScriptError, StandardError => e
    raise ERBRenderingError, e.message
  end
end
