require('rspec')
require('address')

describe(Address) do
  before() do
    Address.clear()
  end

  describe('#street') do
    it('returns a street address') do
      test_address = Address.new({:street => '654 N Broadway Street', :city => 'Portland', :state => 'Oregon', :zip_code => '97314'})
      expect(test_address.street()).to(eq('654 N Broadway Street'))
    end
  end

  describe('#city') do
    it('returns a city') do
      test_address = Address.new({:street => '654 N Broadway Street', :city => 'Portland', :state => 'Oregon', :zip_code => '97314'})
      expect(test_address.city()).to(eq('Portland'))
    end
  end

  describe('#state') do
    it('returns a state') do
      test_address = Address.new({:street => '654 N Broadway Street', :city => 'Portland', :state => 'Oregon', :zip_code => '97314'})
      expect(test_address.state()).to(eq('Oregon'))
    end
  end

  describe('#zip_code') do
    it('returns a zip code') do
      test_address = Address.new({:street => '654 N Broadway Street', :city => 'Portland', :state => 'Oregon', :zip_code => '97314'})
      expect(test_address.zip_code()).to(eq('97314'))
    end
  end

  describe('#save') do
    it('saves an address object in an array') do
      test_address = Address.new({:street => '654 N Broadway Street', :city => 'Portland', :state => 'Oregon', :zip_code => '97314'})
      test_address.save()
      expect(Address.all()).to(eq([test_address]))
    end
  end

  describe('.all') do
    it('returns an empty array of address objects') do
      expect(Address.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('clears the array of addresses for the address class') do
      test_address = Address.new({:street => '654 N Broadway Street', :city => 'Portland', :state => 'Oregon', :zip_code => '97314'})
      test_address.save()
      Address.clear()
      expect(Address.all()).to(eq([]))
    end
  end
end
