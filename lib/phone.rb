class Phone
  attr_reader(:area_code, :number, :type, :id)

  @@phones = []

  define_method(:initialize) do |attributes|
    @area_code = attributes.fetch(:area_code)
    @number = attributes.fetch(:number)
    @type = attributes.fetch(:type)
    @id = @@phones.length().+(1)
  end

  define_method(:save) do
    @@phones.push(self)
  end

  define_singleton_method(:all) do
    @@phones
  end

  define_singleton_method(:clear) do
    @@phones = []
  end

  define_singleton_method(:find) do |id|
    found_phone = nil
    @@phones.each() do |phone|
      if phone.id().eql?(id)
        found_phone = phone
      end
    end
    found_phone
  end
end
