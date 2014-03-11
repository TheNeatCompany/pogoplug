require 'pogoplug/http_helper'
require 'pogoplug/file'
require 'pogoplug/device'
require 'pogoplug/service'
require 'pogoplug/errors'

module PogoPlug
  class ServiceClient

    def initialize(token, url, device_id, service_id)
      @token = token
      @url = url
      @uri = URI(@url)
      @device_id = device_id
      @service_id = service_id
      raise ApiUrlNotAvailable.new("Client requires an api_url #{self.inspect}") if url.nil?
    end

    # Creates a file handle and optionally attach an io.
    # The provided file argument is expected to contain at minimum
    # a name, type and parent_id. If it has a mimetype that will be assumed to
    # match the mimetype of the io.
    def create_entity(file, io = nil, properties = {})
      params = { deviceid: @device_id, serviceid: @service_id, filename: file.name, type: file.type }.merge(properties)
      params[:parentid] = file.parent_id unless file.parent_id.nil?

      file_handle = unless file.id
        response = get('/createFile', params)
        File.from_json(response.body['file'])
      else
        file
      end

      if io
        HttpHelper.send_file(files_url, @token, @device_id, @service_id, file_handle, io)
        file_handle.size = io.size
      end

      file_handle
    end

    def create_entity_if_needed(name, parent_id = nil, io = nil, properties = {})
      parent_id ||= '0'
      files = search(%Q!name="#{name}" and parent_id="#{parent_id}"!)
      if files.blank?
        if io
          create_file(name, parent_id, io, properties)
        else
          create_directory(name, parent_id, properties)
        end
      else
        create_entity(files.first, io)
      end
    end

    def create_directory(directory_name, parent_id=nil, properties = {})
      create_entity(File.create_directory(directory_name, parent_id), nil, properties)
    end

    def create_file(file_name, parent_id, io, properties = {})
      create_entity(File.create_file(file_name, parent_id), io, properties)
    end

    def download(file)
      raise DirectoriesCanNotBeDownloaded.new(file.inspect) unless file.file?

      execute do |request, headers|
        request.get("/svc/files/#{@device_id}/#{@service_id}/#{file.id}/dl", {}, headers)
      end.body
    end

    def download_to(file, destination)
      ::File.open(destination, 'w') do |f|
        f.write(download(file))
      end
    end

    def find_by_id!(id)
      result = get("/getFile", deviceid: @device_id, serviceid: @service_id, fileid: id).body
      File.from_json(result["file"])
    end

    def find_by_id(id)
      begin
        find_by_id!(id)
      rescue PogoPlug::NotFoundError => e
        nil
      end
    end

    def delete(file_id)
      get('/removeFile', deviceid: @device_id, serviceid: @service_id, fileid: file_id, recurse: '1')
    end

    def delete_if_exists(file_id)
      if find_by_id(file_id)
        delete(file_id)
      end
    end

    def search(criteria, options = {})
      params = { deviceid: @device_id, serviceid: @service_id, searchcrit: criteria }.merge(options)
      response = get('/searchFiles', params)
      FileListing.from_json(response.body)
    end

    def files_from_parent(parent_id = '0', offset=0)
      params = { deviceid: @device_id, serviceid: @service_id, pageoffset: offset, parentid: parent_id }
      response = get('/listFiles', params)
      FileListing.from_json(response.body)
    end

    private

    def files_url
      "#{@uri.scheme}://#{@uri.host}/svc/files"
    end

    def get(url, params = {})
      execute do |request, headers|
        request.get("/svc/api#{url}", params, headers)
      end
    end

    def execute
      headers = { 'cookie' => "valtoken=#{@token}" }
      request = ::PogoPlug::HttpHelper.create("#{@uri.scheme}://#{@uri.host}", @logger)
      response = yield(request, headers)
      ::PogoPlug::HttpHelper.raise_errors(response)
      response
    end

  end
end