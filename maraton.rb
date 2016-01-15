require_relative 'view'
require_relative 'model'

class Maraton

  def initialize
    @view = View.new
    @deck = Deck.new
    @res_correctas = 0
    @res_incorrectas = 0
    @view.pantalla_dinamica
    @view.welcome()
    theme_choice()
    @view.pantalla_dinamica
    interface()
  end

  def theme_choice
    @view.theme
    choice = gets.to_i
    check = Integer(choice) rescue 0
    if check.between?(1, 3)
      case check
        when 1
          file = "history.csv"
        when 2
          file = "science.csv"
        when 3
          file = "pop.csv"
      end
      @deck.read_csv(file) 
    else
      @view.pantalla_dinamica
      @view.error
      theme_choice()
    end
  end

  def interface
    while @deck.questions.length != 0
      qa = get_question()
      @view.question(qa)
      user_answer = gets.chomp
      check(user_answer,qa)
      sleep(1)
      @view.pantalla_dinamica
    end
    @view.final(@res_correctas, @res_incorrectas)
  end

  def get_question
    max = @deck.questions.length - 1
    num = rand(0..max)
    qa = @deck.select(num)
  end

  def check(answer,qa)
    answer.downcase!
    qa[1].downcase!
    if answer == qa[1]
      @view.correcto()
      @res_correctas += 1
    else
      @view.incorrecto()
      @res_incorrectas += 1
    end
  end

end

Maraton.new