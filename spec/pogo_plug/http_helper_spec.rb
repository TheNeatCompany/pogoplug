require 'spec_helper'
require 'pogoplug/http_helper'

describe PogoPlug::HttpHelper do

  let(:user_agent){ 'MyCompany/Faraday v0.9.0' }

  before { PogoPlug::HttpHelper::DEFAULT_REQUEST_HEADERS['User-Agent'] = user_agent }
  
  it "includes a default user agent" do
    expect(PogoPlug::HttpHelper::DEFAULT_REQUEST_HEADERS).to include("User-Agent"=> user_agent)
  end

  it "includes default user agent in Faraday connection" do
    connection = PogoPlug::HttpHelper.create("http://foo.bar")
    expect(connection.headers).to include("User-Agent"=> user_agent)
  end

end

