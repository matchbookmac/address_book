class Phone
  attr_reader(:area_code, :number, :type)

  @@phones = []

  define_method(:initialize) do |attributes|
    @area_code = attributes.fetch(:area_code)
    @number = attributes.fetch(:number)
    @type = attributes.fetch(:type)
  end

  define_method(:save) do
    @@phones.push(self)
  end

  define_singleton_method(:all) do
    @@phones
  end
end
