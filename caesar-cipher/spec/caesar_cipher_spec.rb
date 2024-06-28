require_relative '../caesar_cipher'

describe 'Caesar Cipher' do
  describe '#rot_codepoint' do
    it 'returns nil if either input is not an integer' do
      expect(rot_codepoint('a', nil)).to eq(nil)
      expect(rot_codepoint('a', 1)).to eq(nil)
      expect(rot_codepoint(10, [])).to eq(nil)
    end
  end

  describe '#caesar-cipher' do
  end
end

# rot_codepoint:
# - input types
# - input ranges
# - shift properly (no wrap) (lower + upper)
# - shift properly (wrap) (lower + upper)
# - no shift for code points outside of range
