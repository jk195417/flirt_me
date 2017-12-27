class Answer < Sentence
  scope :to_line_actions, -> {
    all.map do |s|
      label = text = s.content
      data = { action: 'flirting', dialogue_id: s.dialogue_id, sequence: s.sequence + 1 }.to_query
      LineBot::Formats::Actions::Postback.new(label, data, text: text)
    end
  }
end
