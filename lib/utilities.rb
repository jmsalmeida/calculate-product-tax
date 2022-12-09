module Utilities
  def get_input_value(message)
    print message
    gets.chomp
  end

  def handle_yes_no(answer)
    answer = answer.empty? ? 'no' : answer
    answer.upcase == 'YES' ? true : false
  end
end