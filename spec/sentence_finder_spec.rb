require_relative '../lib/sentence_finder'

describe SentenceFinder do
  describe '.find' do
    context 'when only one sentence is given' do
      it 'returns the sentence' do
        sentence = SentenceFinder.find("This is a sentence.")
        expect(sentence).to eq("This is a sentence.")
      end
    end

    context 'when two or more sentences are given' do
      it 'finds the sentence with the most alpha-consecutive words' do
        paragraph =
          'A sentence with four alpha-consecutive words. ' +
          'A sentence with five alpha-consecutive words.'
        sentence = SentenceFinder.find(paragraph)
        expect(sentence).to eq('A sentence with five alpha-consecutive words.')
      end
    end
  end
end
