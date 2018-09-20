require_relative '../lib/sentence_finder'

describe SentenceFinder do
  describe '.find' do
    context 'when only one sentence is given' do
      it 'returns the sentence' do
        sentence = SentenceFinder.find("This is a sentence.")
        expect(sentence).to eq("This is a sentence.")
      end
    end

    it 'can find a sentence with an alpha-consecutive word'
  end
end
