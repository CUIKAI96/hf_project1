require 'tty-prompt'
prompt = TTY::Prompt.new

puts("commands you can use:
      service:new
      service:remove
      provider:new
      provider:remove
      schedule:new
      schedule:list")


if ARGV[0] == 'service:new'
  name = prompt.ask('name:')
  price = prompt.ask('price:')
  length = prompt.ask('length:')

  File.open("service.txt", 'a') { |file| file.write("\n #{name}, #{price}, #{length}") }

elsif ARGV[0] == 'service:remove'
  name_remove = prompt.ask('name:')
  input_lines = File.readlines('service.txt')
  input_lines.pop("#{name_remove}")

elsif ARGV[0] == 'provider:new'
  provider_name = prompt.ask('provider name:')
  phone_number = prompt.ask('provider phone number:')
  service_list = prompt.ask('list of services provided:')

  File.open("provider.txt", 'a') { |file| file.write("\n #{provider_name}, #{phone_number}, #{service_list}")}

elsif ARGV[0] == 'provider:remove'

end