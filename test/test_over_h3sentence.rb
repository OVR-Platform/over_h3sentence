require "minitest/autorun"
require "over_h3sentence"

class OverH3sentenceTest < Minitest::Test
  def test_valid_sentence
    assert OverH3sentence.sentence('8c1ea284caf05ff') == 'latest.sell.emotionally'
    assert OverH3sentence.sentence('8c1ea6c8ec9e5ff') == 'changes.savannah.recommending'
  end

  def test_valid_hex_id
    assert OverH3sentence.hex_id('latest.sell.emotionally') == '8c1ea284caf05ff'
    assert OverH3sentence.hex_id('changes.savannah.recommending') == '8c1ea6c8ec9e5ff'
  end
end
