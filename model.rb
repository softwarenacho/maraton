require 'csv'

class Deck

  attr_accessor :questions, :answers

  def initialize
    @questions = []
    @answers = []
  end

  def read_csv(file)
    i = 0
    theme_csv = CSV.read(file)
    theme_csv.each do |element|
      if i % 2 == 0
        question = element[0]
        @questions << question
        i += 1
      else
        answer = element[0]
        @answers << answer
        i += 1
      end
    end
  end

  def select(num)
    qa = [@questions[num],@answers[num]]
    delete(num)
    qa
  end

  def delete(num)
    @questions.delete_at(num)
    @answers.delete_at(num)
  end

end
