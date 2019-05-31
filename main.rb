require 'tty-prompt'
require_relative 'class'
prompt = TTY::Prompt.new

service_list =  []
service_list.push(Service.new('spiritual healing', 200, 1))

provider_list = []
provider_list.push(Provider.new('Kai', 'spiritual healing', 7349908790))

if ARGV[0] == 'service:add'
  name = prompt.ask('name:')
  price = prompt.ask('price:')
  length = prompt.ask('length:')git
  service_list.push(Service.new(name, price, length))
elsif ARGV[0] == 'service:delete'
  name = prompt.ask('name:')
  service_list.delete_if {|item| item.name == "#{name}"}
elsif ARGV[0] == 'provider:add'
  name = prompt.ask('name:')
  service = prompt.ask('service:')
  phone = prompt.ask('phone number:')
  provider_list.push(Provider.new(name, service, phone))
elsif ARGV[0] == 'provider:delete'
  name = prompt.ask('name:')
  provider_list.delete_if {|item| item.name == "#{name}" }
elsif ARGV[0] == 'appointment:add'
  name_client = prompt.ask('client name:')
  name_service = prompt.ask('service name:')
  one_aptmt = prompt.ask('is this one time appointment?')
  if one_aptmt == 'Y'/'y'
    # puts open time slots here
    time_client = prompt.ask('choose one of the above slot')
  end
end
