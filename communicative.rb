require_relative "test"
require_relative "result_printer"
current_path = "./" + File.dirname(__FILE__)
file_path_questions = current_path + '/data/' + 'questions.txt'
file_path_results = current_path + '/data/' + 'results.txt'

name = ARGV[0]

if (Gem.win_platform? && ARGV[0])
  name = name.dup
           .force_encoding("IBM866")
           .encode("IBM866", "cp1251")
           .encode("UTF-8")
end

if name == nil
  name = "Юзер"
end

user = Test.new
puts "Приветствуем Вас #{name}, предлагаем Вам пройти тест:"
puts "Введите '1' - если да, '2' - нет, '3' - иногда"

#Получаем массив вопросов
questions = user.questions(file_path_questions)

#задаем вопросы в переборке массива и там же считаем баллы.
for question in questions
  puts question
  user.answer
  puts "Ваш текущий балл #{user.answer_points}"
end

# while count != 16
#   puts questions[count]
#   count += 1
#   user.answer
#   puts "Ваш текущий балл #{user.answer_points}"
# end

puts "#{name}, Вы прошли тест, Ваш результат #{user.answer_points}. Вот, что это значит:"

result = Result.new(file_path_results)

result.result_print(user.answer_points)

puts "Спасибо, #{name}, за участие в тестировании!"