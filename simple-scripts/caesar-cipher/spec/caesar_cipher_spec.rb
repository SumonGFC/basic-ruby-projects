# frozen_string_literal: true

require_relative '../caesar_cipher'

describe 'Caesar Cipher' do
  describe '#rot_codepoint' do
    before :all do
      @uppers = *65..90
      @downers = *97..122
      @non_alphas = [*0..64] + [*91..96] + [*123..127]
    end

    it 'raises ArgumentError if either input is not an integer' do
      expect { rot_codepoint('a', nil) }.to raise_error(ArgumentError)
      expect { rot_codepoint('a', 1) }.to raise_error(ArgumentError)
      expect { rot_codepoint(10, []) }.to raise_error(ArgumentError)
    end

    it 'raises RangeError if code is out of bounds' do
      expect { rot_codepoint(128, 0) }.to raise_error(RangeError)
      expect { rot_codepoint(-1, 0) }.to raise_error(RangeError)
    end

    it 'returns original string if key is congruent to 26' do
      expect(rot_codepoint(74, 0)).to eq(74)
      expect(rot_codepoint(74, 26)).to eq(74)
      expect(rot_codepoint(74, -26)).to eq(74)
      expect(rot_codepoint(74, 52)).to eq(74)
      expect(rot_codepoint(74, -52)).to eq(74)
    end

    it 'shifts properly (wrap)' do
      @uppers[1...-1].each do |code|
        expect(rot_codepoint(code, 25)).to eq(code - 1)
      end

      @downers[1...-1].each do |code|
        expect(rot_codepoint(code, 25)).to eq(code - 1)
      end
    end

    it 'shifts properly (no wrap)' do
      @uppers[0...-1].each do |code|
        expect(rot_codepoint(code, 1)).to eq(code + 1)
      end

      @downers[0...-1].each do |code|
        expect(rot_codepoint(code, 1)).to eq(code + 1)
      end
    end

    it 'leaves non alphabetical codepoints the same' do
      @non_alphas.each do |code|
        expect(rot_codepoint(code, 1)).to eq(code)
      end
    end
  end

  describe '#caesar-cipher' do
  end
end

# rot_codepoint:
# - input types -- DONE
# - input ranges -- DONE
# - doesn't shift if key is congruent to 26 -- DONE
# - shift properly (no wrap) (lower + upper)
# - shift properly (wrap) (lower + upper)
# - no shift for code points outside of range
