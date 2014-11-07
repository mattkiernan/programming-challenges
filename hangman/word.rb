class Word
  WORD_OPTIONS = %w(cat baseball hamburger country hotel spaghetti hospital mouse moose lamp hanger tuna television running tiger beard stove dragon)

  def initialize
    @word = pick_random_word
    @length = @word.length
  end

  attr_reader :word, :length

  def pick_random_word
    WORD_OPTIONS.sample
  end
end
