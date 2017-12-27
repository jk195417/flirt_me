class LineBot::Formats::Messages::Template < LineBot::Formats::Message
  attr_accessor :altText, :template

  VALUES_TYPE = { '@template' => LineBot::Formats::Template }.freeze

  def initialize(altText, template)
    @type = 'template'
    @altText = altText
    @template = template
  end
end
