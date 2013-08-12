require_relative 'helper'

module PogoPlug
  class DeviceTest < Test::Unit::TestCase
    context "Device" do
      setup do
        @name = "Pogoplug Cloud"
        @id = "XCLDGAAAHE5B5NKDKMUXJ52F9J"
        @device = PogoPlug::Device.new(@name, @id)
      end

      should "provide a name" do
        assert_equal(@device.name, @name)
      end

      should "provide an ID" do
        assert_equal(@device.id, @id)
      end

      should "allow services to be added" do
        service = PogoPlug::Service.new("some name", "some id")
        @device.services << service
        assert_equal(@device.services.first, service)
      end

      should "provide a collection of services" do
        assert_kind_of(Enumerable, @device.services)
      end

      should "be able to build instances from JSON" do
        json = %q{
          {
            "deviceid": "XCLDGAAAHE5B5NKDKMUXJ52F9J",
            "type": "xce:cloud",
            "name": "Pogoplug Cloud",
            "version": "LINUX GENERIC - 4.6.0.12",
            "flags": "0",
            "ownerid": "1a3edf8b7a987226ec0840f37bf35cc5",
            "sku": {
              "id": "36",
              "oem": "Cloud Engines",
              "name": "POGOCLOUD-MCLOUDFREE",
              "username": "Pogoplug Cloud",
              "terms": "0"
            },
            "provisionflags": "0",
            "authorized": "1",
            "plan": {
              "duration": "-1",
              "limit": "0",
              "name": "POGOCLOUD-MCLOUDFREE",
              "startdate": "1376079072110",
              "type": "POGOCLOUD"
            },
            "services": [
              {
                "deviceid": "XCLDGAAAHE5B5NKDKMUXJ52F9J",
                "serviceid": "XCLDGAAAHE5B5NKDKMUXJ52F9J",
                "sclass": "1",
                "type": "xce:plugfs:cloud",
                "name": "Pogoplug Cloud",
                "version": "4.6.0.12",
                "online": "1",
                "msgpending": "0",
                "apiurl": "https://cl0c0.pogoplug.com/svc/api/",
                "space": "5000000000/5000000000",
                "flags": "0",
                "onlan": "0",
                "metaver": "0"
              }
            ]
          }
        }
        device = Device.from_json(JSON.parse(json))
        assert_equal(device.name, "Pogoplug Cloud")
        assert_equal(device.id, "XCLDGAAAHE5B5NKDKMUXJ52F9J")
        assert_equal(device.services.size, 1, "Expected 1 service")
      end
    end
  end
end
