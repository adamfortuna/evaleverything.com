module Jekyll
  class PullsideTag < Liquid::Block
    def initialize(tag_name, markup, tokens)
      @align = (markup =~ /left/i) ? "left" : "right"
      @code = (markup =~ /code/i) ? "code" : ""
      super
    end

    def render(context)
      output = super
      "<div class='pull-#{@align} #{@code}'>#{output}</div>"
    end
  end
end

Liquid::Template.register_tag('pullside', Jekyll::PullsideTag)
