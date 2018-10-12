require_relative '../lib/sentence_finder'

describe SentenceFinder do
  describe '.find' do
    context 'when only one sentence is given' do
      it 'returns the sentence' do
        sentence = SentenceFinder.find('This is a sentence.')
        expect(sentence).to eq('This is a sentence.')
      end
    end

    it 'can find a sentence with an alpha-consecutive word' do
      paragraph =
        'This is a test paragraph. There are some words in it. Lots of words.'
      sentence = SentenceFinder.find(paragraph)
      expect(sentence).to eq('This is a test paragraph.')
    end

    it 'can deal with ellipses' do
      paragraph = 'A test with an ellipsis... Hard to deal with.'
      sentence = SentenceFinder.find(paragraph)
      expect(sentence).to eq('A test with an ellipsis...')
    end

    it 'picks the first sentence that has the most alpha-consecutive' do
      paragraph =
        'Two sentences with the same numbers of alphabet-consecutive words. ' \
        'Both sentences have five words which are consecutive and that is it'
      sentence = SentenceFinder.find(paragraph)
      expect(sentence).to eq(
        'Two sentences with the same numbers of alphabet-consecutive words.'
      )
    end

    it 'handles punctuation' do
      paragraph =
        'How do you deal with question marks? ' \
        'Surely you can deal with exclamation marks! ' \
        'My solution can, and it can also deal with commas.'
      sentence = SentenceFinder.find(paragraph)
      expect(sentence).to eq('Surely you can deal with exclamation marks!')
    end

    it 'only counts words once' do
      paragraph =
        'Double-counting words with lots of consecutive characters. ' \
        'Like abcdefghijklmno.'
      sentence = SentenceFinder.find(paragraph)
      expect(sentence).to eq(
        'Double-counting words with lots of consecutive characters.'
      )
    end

    it 'can deal with proper nouns' do
      paragraph = 'Sentences.... Sentences for Miles.'
      sentence = SentenceFinder.find(paragraph)
      expect(sentence).to eq('Sentences for Miles.')
    end
  end
end
