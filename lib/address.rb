class Address
  attr_reader(:street, :city, :state, :zip_code, :id)

  @@addresses = []

  define_method(:initialize) do |attributes|
    @street = attributes.fetch(:street)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip_code = attributes.fetch(:zip_code)
  end

  define_method(:save) do
    @@addresses.push(self)
  end

  define_singleton_method(:all) do
    @@addresses
  end

  define_singleton_method(:clear) do
    @@addresses = []
  end
end
