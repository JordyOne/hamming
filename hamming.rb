require_relative "testing_library"

def hamming(strand_1, strand_2)
  hamming_distance = 0
  if strand_1 >= strand_2
    var_1 = strand_2
    var_2 = strand_1
  else
    var_1 = strand_1
    var_2 = strand_2
  end
  var_1.each_char do |letter|
    x = var_1.index(letter)
    if letter != var_2[x]
      hamming_distance = hamming_distance + 1
    end
  end
  hamming_distance
end

check("Hamming distance between identical strands",
      hamming("A", "A") == 0)

check("Hamming distance for single nucleotide strand",
      hamming("A", "G") == 1)

check("Hamming distance between small strands",
      hamming("AG", "CT") == 2)

check("Hamming distance between two other small strands",
      hamming("AT", "CT") == 1)

check("Hamming distance in longer strands",
      hamming("GGACG", "GGTCG") == 1)

check("Ignoring extra length in the first strand when it's longer",
      hamming("AAAG", "AAA") == 0)

check("Ignoring extra length in the second strand when it's longer",
      hamming("AAA", "AAAG") == 0)