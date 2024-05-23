require 'json'

class OverH3sentence
  LIST_OF_WORDS = JSON.parse(File.read(File.join(File.dirname(__FILE__), './list_of_words_v1.json')))
  COMBINATIONS_VOCAB = ['000','001','010','011','100','101','110','111','002','012','020','021','022','102','112','120','121','122','200','201','202','210','211','212','220','221','222']

  def self.sentence(hex_id)
    raise ArgumentError, 'Hex id must be 15 characters long' if hex_id.length != 15

    words = form_h3_to_words(hex_id.to_i(16))
    words.join('.')
  end

  def self.form_h3_to_words(h3_address)
    binary = h3_address.to_s(2)

    binary_clean = binary[8..50]
    integer = binary_clean.to_i(2)
    str_integer = integer.to_s
    integer_length = str_integer.length
    if (integer_length < 13)
      for i in 0..12-integer_length do
        str_integer = "0#{str_integer}"
      end
    end
    integer_first_value = str_integer[0]
    first_word_idx = "#{COMBINATIONS_VOCAB[integer_first_value.to_i][0]}#{str_integer[1,4]}".to_i % 30000
    first_word = LIST_OF_WORDS[first_word_idx]
    second_word_idx = "#{COMBINATIONS_VOCAB[integer_first_value.to_i][1]}#{str_integer[5..8]}".to_i % 30000
    second_word = LIST_OF_WORDS[second_word_idx]
    third_word_idx = "#{COMBINATIONS_VOCAB[integer_first_value.to_i][2]}#{str_integer[9..-1]}".to_i % 30000
    third_word = LIST_OF_WORDS[third_word_idx.to_i]

    [first_word, second_word, third_word]
  end
end
