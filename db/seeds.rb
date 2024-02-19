require 'json'

data = JSON.parse(File.read(Rails.root.join('app/assets/data.json')))

unless data.is_a?(Array)
  puts 'Invalid data.json file format: It should be an array of people'
  exit
end

data.each do |person_data|
  unless person_data.key?('name') && person_data.key?('info')
    puts 'Invalid person data format: Missing required keys'
    next
  end

  person_info = person_data['info']

  person = Person.create(
    name: person_data['name'],
    email: person_info['email']
  )
end
