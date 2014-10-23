require 'spec_helper'
require 'pogoplug/http_helper'

describe PogoPlug::HttpHelper do

  it "includes Neat in default user agent" do 
    expect(PogoPlug::HttpHelper::DEFAULT_USER_AGENT).to match(/Neat/)
  end

  it "includes default user agent in Faraday connection" do
    connection = PogoPlug::HttpHelper.create("http://foo.bar")
    expect(connection.headers).to include("User-Agent"=> PogoPlug::HttpHelper::DEFAULT_USER_AGENT)
  end

end

