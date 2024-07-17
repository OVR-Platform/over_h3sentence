require 'json'

class OverH3sentence
  LIST_OF_WORDS = JSON.parse(File.read(File.join(File.dirname(__FILE__), './list_of_words_v2.json')))
  COMBINATIONS_VOCAB = ['000','001','010','011','100','101','110','111','002','012','020','021','022','102','112','120','121','122','200','201','202','210','211','212','220','221','222']

  def self.sentence(hex_id)
    raise ArgumentError, 'Hex id must be 15 characters long' if hex_id.length != 15

    words = form_h3_to_words(hex_id.to_i(16))
    words.join('.')
  end

  def self.hex_id(sentence)
    raise ArgumentError, 'Sentence must be 3 words long' if sentence.split('.').length != 3

    h3_address = form_words_to_h3(sentence.split('.'))
    h3_address.to_s(16)
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

  def self.form_words_to_h3(words)
    h3_invariant_head = '10001100'
    h3_invariant_tail = '111111111'

    triplet_adj = []
    str_value = ''

    for i in 0..words.length-1 do
      for j in 0..LIST_OF_WORDS.length do
        if (LIST_OF_WORDS[j] === words[i])
          str_value = j.to_s
        end
      end
      length_string = str_value.length
      if (length_string < 5)
        for n in 0..5-length_string-1 do
          str_value = "0#{str_value}"
        end
      end

      triplet_adj.push(str_value)
    end


    first_trinary_code = triplet_adj[0][0] + triplet_adj[1][0] + triplet_adj[2][0]
    first_integer_value = 0

    COMBINATIONS_VOCAB.each_with_index do |value, index|
      if (value === first_trinary_code.to_s)
        first_integer_value = index
      end
    end
    full_integer = (first_integer_value).to_s + triplet_adj[0][-4..-1].to_s + triplet_adj[1][-4..-1].to_s + triplet_adj[2][-4..-1].to_s
    binary_full_integer = full_integer.to_i.to_s(2)
    binary_full_integer_length = binary_full_integer.length
    for i in 0..43-binary_full_integer_length-1 do
      binary_full_integer = "0#{binary_full_integer}"
    end

    whole_binary = h3_invariant_head + binary_full_integer + h3_invariant_tail

    whole_binary.to_i(2)
  end
end
