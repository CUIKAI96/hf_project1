class Service
  def initialize(name, price, length)
    @name = name
    @price = price
    @length = length
  end

  def name
    @name
  end

  def price
    @price
  end

  def length
    @length
  end
end

class Provider
  def initialize(name, service, phone)
    @name = name
    @service = service
    @phone = phone
  end

  def name
    @name
  end

  def service
    @service
  end

  def phone
    @phone
  end
end

class Appointment
  def initialize(date, time, service, client, provider)
    @date = date
    @time = time
    @service = service
    @client = client
    @provider = provider
  end

  def date
    @date
  end

  def time
    @time
  end

  def service
    @service
  end

  def client
    @client
  end

  def provider
    @provider
  end
end