# frozen_string_literal: true

lorem_ipsum = 'Задача организации, в особенности же реализация намеченных плановых заданий обеспечивает широкому кругу (специалистов) участие в формировании систем массового участия. Не следует, однако забывать, что сложившаяся структура организации требуют от нас анализа форм развития. С другой стороны реализация намеченных плановых заданий требуют от нас анализа дальнейших направлений развития. Значимость этих проблем настолько очевидна, что дальнейшее развитие различных форм деятельности способствует подготовки и реализации направлений прогрессивного развития.'
lorem_ipsum2 = 'Повседневная практика показывает, что рамки и место обучения кадров в значительной степени обуславливает создание системы обучения кадров, соответствует насущным потребностям. Идейные соображения высшего порядка, а также новая модель организационной деятельности способствует подготовки и реализации форм развития. Не следует, однако забывать, что рамки и место обучения кадров требуют от нас анализа форм развития. Не следует, однако забывать, что укрепление и развитие структуры влечет за собой процесс внедрения и модернизации новых предложений.'
lorem_ipsum3 = 'Повседневная практика показывает, что дальнейшее развитие различных форм деятельности способствует подготовки и реализации форм развития. Значимость этих проблем настолько очевидна, что укрепление и развитие структуры требуют определения и уточнения соответствующий условий активизации. С другой стороны новая модель организационной деятельности позволяет оценить значение соответствующий условий активизации. Равным образом новая модель организационной деятельности обеспечивает широкому кругу (специалистов) участие в формировании новых предложений. Таким образом дальнейшее развитие различных форм деятельности позволяет выполнять важные задания по разработке направлений прогрессивного развития.'
lorem_ipsum_short = 'Задача организации, в особенности же реализация намеченных плановых заданий'
lorem_ipsum_shorter = 'Задача организации в особенности'


ActiveRecord::Base.transaction do
  people = Person.first(3)

  Phone.create!(number: '297334455', description: lorem_ipsum, person: people.first)
  Phone.create!(number: '296334455', description: lorem_ipsum2, person: people.first)
  Phone.create!(number: '294334455', description: lorem_ipsum3, person: people.first)
  Phone.create!(number: '444334455', description: lorem_ipsum, person: people.last)

  Phone.create!(number: '297771267', description: lorem_ipsum_short, person: people[1])
  Phone.create!(number: '297639021', description: lorem_ipsum_shorter, person: people[1])
end
