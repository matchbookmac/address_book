class Email
  attr_reader(:user_name, :domain)

  @@emails = []

  define_method(:initialize) do |attributes|
    @user_name = attributes.fetch(:user_name)
    @domain = attributes.fetch(:domain)
  end

  define_method(:save) do
    @@emails.push(self)
  end

  define_singleton_method(:all) do
    @@emails
  end

  define_singleton_method(:clear) do
    @@emails = []
  end
end
