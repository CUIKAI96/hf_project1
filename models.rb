class Service
  attr_accessor :name, :price, :length
  def initialize(name, price, length)
    @name = name
    @price = price
    @length = length
  end
end

class Provider
  attr_accessor :name, :service, :phone
  def initialize(name, service, phone)
    @name = name
    @service = service
    @phone = phone
  end

end

# modify this with Time object
class Appointment
  attr_accessor :date, :time, :service, :client, :provider
  def initialize(time, service, client, provider)
    @time = time
    @service = service
    @client = client
    @provider = provider
  end
end

class ProviderSchedule
  attr_accessor :date, :time, :name, :length
end

def appointment_validator(appointment, service_list, appointment_list, provider_list)
  start_time = appointment.time
  service_names = []
  provider_names = []
  service_list.each do |service|
    service_names.push(service.name)
  end
  provider_list.each do |provider|
    provider_names.push(provider.name)
  end
  if (!service_names.include?(name_service))
    puts "
          Please use service:add to add service
         "
  end
  if (!provider_names.include?(name_provider))
    puts "
          Please use provider:add to add provider
         "
  end

  service_list.each do |service|
    length = service.length
    if service.name == name_service
      end_time = start_time + 60*60*length
    end
  end

  # service_list
  #
  # appointment_list.each do |appointment_old|
  #   if (appointment_old.provider) == appointment.provider
  #     if (appointment_old.date) == appointment.date
  #       schedule = []
  #       schedule.push(appointment_old.time)
  #       start_time = appointment.time
  #     end
  #   end
  # end
end

# def add_to_schedule(appointment)
#   start_time = time.chomp("am" or "pm")
#   end_time = start_time + lengt
# end

# schedule = ProviderSchedule.new(appointment.date, appointment.time, provider.name, service.length)