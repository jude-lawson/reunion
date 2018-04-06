require 'erb'

class HTMLReader

  def create_template_string(path)
    convert_to_erb(File.read('../templates/index.html'))
  end

  def convert_to_erb
    create_html_with_values(ERB.new(template_string))
  end

  def create_html_with_values(template)
    template.result
  end

end