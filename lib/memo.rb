# frozen_string_literal: true

# Класс "Заметка", разновидность базового класса "Запись"
class Memo < Post
  def read_from_console
    puts 'Я сохраню всё, что ты напишешь до строчки "end" в файл.'

    @text = []
    line = nil

    while line != 'end'
      line = STDIN.gets.strip
      @text << line
    end

    @text.pop
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')} \n\r"

    @text.unshift(time_string)
  end

  def to_db_hash
    super.merge(
      'text' => @text.join('\n\r')
    )
  end

  def load_data(data_hash)
    super(data_hash)

    @text = data_hash['text'].split('\n\r')
  end
end
