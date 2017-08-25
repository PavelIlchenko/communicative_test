class Test
  attr_reader :questions, :answer_points

  def initialize
    @answer_points = 0
  end

  def questions(file_name)
    if !File.exist?(file_name)
      return nil
    end
    # Открываем файл, явно указывая его кодировку, читаем все строки в массив и
    # закрываем файл.
    file = File.new(file_name, "r:UTF-8")
    lines = file.readlines
    file.close
    lines
  end

  def answer
    answer = STDIN.gets.chomp
    while answer != "1" && answer != "2" && answer != "3" do
      puts "Вы ввели некорректный ответ, выберите 1, 2 или 3:"
      answer = STDIN.gets.chomp
    end
    if answer == "1"
      @answer_points +=2
    elsif answer == "2"
      @answer_points +=1
    end
  end

end