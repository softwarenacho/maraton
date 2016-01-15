require 'colorize'

class View

  def welcome
    puts "\nWelcome to Trivial Pursuit. Just guess the answer to the question.\nReady? Let's play!"
  end

  def theme
    puts "\nChoose a theme: (1.History 2.Science 3.Pop culture)"
  end

  def question(qa)
    puts "\nQuestion\n#{qa[0]}"
    print "Answer: "
  end

  def correcto
    puts "¡Correct!".colorize(:green)
  end

  def incorrecto
    puts "¡Incorrect!".colorize(:red)
  end

  def final(correct, incorrect)
    puts "\nYou had" + " #{correct} Correct answers ".colorize(:green) + "and" + " #{incorrect} Incorrect answers.\n".colorize(:red)
    puts "Thanks for playing!"
  end

  def error
    puts "Only numbers displayed"
  end

  def pantalla_dinamica
    clear_screen!()
    move_to_home!()
    reputs()
  end

  def clear_screen!
    print "\e[2J"
  end

  def move_to_home!
    print "\e[H"
  end

  def reputs(str = '')
    puts "\e[0K" + str
  end

end