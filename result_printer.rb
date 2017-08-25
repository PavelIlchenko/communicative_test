class Result
  def initialize(file_name)
    if !File.exist?(file_name)
      return nil
    end
    # Открываем файл, явно указывая его кодировку, читаем все строки в массив и
    # закрываем файл.
    file = File.new(file_name, "r:UTF-8")
    @lines = file.readlines
    file.close
  end

  def result_print(answers_points)
    if answers_points > 29
      puts @lines[0]
    elsif answers_points >= 25 && answers_points <= 29
      puts @lines[1]
    elsif answers_points >= 19 && answers_points <= 24
      puts @lines[2]
    elsif answers_points >= 14 && answers_points <= 18
      puts @lines[3]
    elsif answers_points >= 9 && answers_points <= 13
      puts @lines[4]
    elsif answers_points >= 4 && answers_points <= 8
      puts @lines[5]
    elsif answers_points <= 3
      puts @lines[6]
    end
  end
end