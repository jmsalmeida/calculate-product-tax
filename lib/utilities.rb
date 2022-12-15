module Utilities
  def get_input_value(message)
    print message
    gets.chomp
  end

  def handle_yes_no(answer)
    answer = answer.empty? ? 'no' : answer
    answer.upcase == 'YES' ? true : false
  end

  def round_tax(tax)
    return ((tax * 20).ceil.to_f) / 20
  end
end