require 'tty-prompt'
require_relative 'class'
prompt = TTY::Prompt.new

service_list =  []
service_list.push(Service.new('spiritual healing', 200, 1))
service_list.push(Service.new('yoga', 300, 1))
service_list.push(Service.new('swimming',200,1))

provider_list = []
provider_list.push(Provider.new('Kai', 'spiritual healing', 7349908790))
provider_list.push(Provider.new('Ashish', 'yoga, spiritual healing', 7890029087))

if !ARGV[0]
  puts "Welcome to Hacker Fellows. Please use the following commands: "
  puts "
        service:add
        service:delete
        provider:add
        provider:delete
        appointment:add
        appointment:list
        exit
       "
  response = prompt.ask("enter a command")
end

# change all argv[0] to response
while response != 'exit'.downcase



  if response == 'service:add'
    name = prompt.ask('name:')
    price = prompt.ask('price:')
    length = prompt.ask('length:')
    service_list.push(Service.new(name, price, length))
    puts "New service successfully added!"
    puts "Here is your new service list:"
    puts service_list.inspect
  elsif response == 'service:delete'
    name = prompt.ask('name:')
    service_list.delete_if {|item| item.name == "#{name}"}
    puts "Service successfully deleted!"
    puts "Here is your new service list:"
    puts service_list.inspect
  elsif response == 'provider:add'
    name = prompt.ask('name:')
    service = prompt.ask('service:')
    phone = prompt.ask('phone number:')
    provider_list.push(Provider.new(name, service, phone))
    puts "Service provider successfully added!"
    puts "Here is your new provider list:"
    puts provider_list.inspect
  elsif response == 'provider:delete'
    name = prompt.ask('name:')
    provider_list.delete_if {|item| item.name == "#{name}" }
    puts "Service provider successfully deleted!"
    puts "Here is your new provider list:"
    puts provider_list.inspect
  elsif response == 'appointment:add'
    name_client = prompt.ask('client name:')
    name_service = prompt.ask('service name:')
    one_aptmt = prompt.ask('is this one time appointment?')
    if one_aptmt == 'Y'/'y'
      # puts open time slots here
      time_client = prompt.ask('choose one of the above slot')
    end
  end
  response = prompt.ask("enter a command")
end
