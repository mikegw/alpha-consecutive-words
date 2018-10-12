module SentenceFinder
  class << self
    def find(paragraph)
      sentences = paragraph.scan(/\w[^.?!]*[.?!]+/)
      sentences.max_by { |sentence| alpha_consecutive_word_count(sentence) }
    end

    private

    def alpha_consecutive_word_count(sentence)
      words = sentence.split(' ')
      words.count { |word| has_alpha_consecutive_letters?(word) }
    end

    def has_alpha_consecutive_letters?(word)
      downcased = word.downcase
      downcased.chars.any? { |char| downcased.include?(char.next) }
    end
  end
end
