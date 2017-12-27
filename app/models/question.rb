class Question < Sentence
  scope :content, -> {
    all.map(&:content).join("\n")
  }
end
