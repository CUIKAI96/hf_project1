require 'tty-prompt'
require_relative 'models'
prompt = TTY::Prompt.new

service_list =  []
service_list.push(Service.new('spiritual healing', 200, 1))
service_list.push(Service.new('yoga', 300, 5))
service_list.push(Service.new('swimming',200,1))

provider_list = []
provider_list.push(Provider.new('Kai', 'spiritual healing', 7349908790))
provider_list.push(Provider.new('Ashish', 'yoga, spiritual healing', 7890029087))

appointment_list = []
appointment_list.push(Appointment.new(Time.now, 'yoga', 'Matt', 'Ashish'))

if !ARGV[0]
  puts "Welcome to Hacker Fellows. Please use the following commands: "
  puts "
        service:add
        service:delete
        provider:add
        provider:delete
        appointment:add
        schedule:view
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
    puts "Here is your new service list:
          ------------------------------"
    service_list.each do |service|
      puts "
            Service: #{service.name}
            Price: $#{service.price}
            Length: #{service.length} hrs
           "
    end
    puts "
          ------------------------------"

  elsif response == 'service:delete'
    name = prompt.ask('name:')
    service_list.delete_if {|item| item.name == "#{name}"}
    puts "Service successfully deleted!"
    puts "Here is your new service list:
          ------------------------------"
    service_list.each do |service|
      puts "
            Service: #{service.name}
            Price: $#{service.price}
            Length: #{service.length} hrs
           "
    end
    puts "
          ------------------------------"

  elsif response == 'provider:add'
    name = prompt.ask('name:')
    service = prompt.ask('services:')
    phone = prompt.ask('phone number:')
    provider_list.push(Provider.new(name, service, phone))
    puts "Service provider successfully added!"
    puts "Here is your new provider list:
          ------------------------------"
    provider_list.each do |provider|
      puts "
            Provider: #{provider.name}
            Services: #{provider.service}
            Phone Number: #{provider.phone}
           "
    end
    puts "
          ------------------------------"

  elsif response == 'provider:delete'
    name = prompt.ask('name:')
    provider_list.delete_if {|item| item.name == "#{name}" }
    puts "Service provider successfully deleted!"
    puts "Here is your new provider list:
          ------------------------------"
    provider_list.each do |provider|
      puts "
            Provider: #{provider.name}
            Services: #{provider.service}
            Phone Number: #{provider.phone}
           "
    end
    puts "
          ------------------------------"

  elsif response == 'appointment:add'
    name_client = prompt.ask('client name:')
    name_service = prompt.ask('service name:')
    name_provider = prompt.ask('provider name:')
    month = prompt.ask('what month do you want your appointment:')
    day = prompt.ask('What day do you want your appointment:')
    time_client = prompt.ask('what time do you want your appointment (ex 01:30):')
    hour = time_client.slice(0..1)
    min = time_client.slice(3,4)

    time = Time.new(2020,month.to_i, day.to_i,hour.to_i,min.to_i)
    appointment = Appointment.new(time, name_service, name_client, name_provider)
    # use these info to create an appointment object
    appointment_validator(appointment, service_list, appointment_list, provider_list)

    # appointment validator
    # puts "appointment successfully added or appointment denied based on appointment validator output"

  elsif response == 'schedule:view'
    name_provider = prompt.ask('Provider name:')
    month = prompt.ask('What month would you like to view:')
    day = prompt.ask('What day would you like to view:')
    puts "Here is your provider's schedule for the day:
         ----------------------------------------------"
    provider_list.each do |provider|
      appointment_list.each do |appointment|
        if appointment.provider.include?(provider.name)
          puts "
                Client: #{appointment.client}
                Service: #{appointment.service}
                Time: #{appointment.time}

         ----------------------------------------------"
        end
      end
    end

  end
  response = prompt.ask("enter a command")
end