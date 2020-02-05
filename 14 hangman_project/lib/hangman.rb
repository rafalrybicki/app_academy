class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    return [] if !@secret_word.include?(char)

    @secret_word.split("").each_with_index.inject([]) do |acc, (el, i)|
      acc << i if char == el
      acc
    end
  end

  def fill_indices(char, arr)
    arr.each {|el| @guess_word[el] = char }
  end

  def try_guess(char)
    if already_attempted?(char)
      print 'that has already been attempted'
      false
    else
      matched_indicies = get_matching_indices(char)
      if matched_indicies.length > 0
        fill_indices(char, matched_indicies)
      else
        @remaining_incorrect_guesses -= 1
      end
      @attempted_chars << char
      true 
    end
  end
  
  def ask_user_for_guess
    p 'Enter a char:'
    response = gets.chomp
    try_guess(response)
  end

  def win?
    if @guess_word.join('') == @secret_word 
      p 'WIN'
      true
    else
      false
    end
  end

  def lose?
    return false if @remaining_incorrect_guesses > 1
    p 'LOSE'
    true
  end

  def game_over?
    if win? || lose?
      p @secret_word
      true
    else
      false
    end
  end

end
