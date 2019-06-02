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

class Appointment
  attr_accessor :date, :time, :service, :client, :provider
  def initialize(date, time, service, client, provider)
    @date = date
    @time = time
    @service = service
    @client = client
    @provider = provider
  end
end

class AppointmentValidator
  attr_accessor :appointment
  def initialize(appointment)
    @appointment = appointment
    @client = appointment.client
    @provider = appointment.provider
    @service = appointment.service
    @date = appointment.date
    @time = appointment.time
  end

  def validate
    # put criteria to validate here
  end
end