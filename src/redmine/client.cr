require "./client/*"
require "http/headers"
require "http/params"
require "http/client"

module Redmine
  class Client
    getter base_uri : String
    getter api_token : String

    def initialize(@base_uri, @api_token)
    end

    def issues
      @issues ||= Issues.new self
    end

    def checklist
      @checklist ||= Checklist.new self
    end

    def time_entries
      @time_entries ||= TimeEntries.new self
    end

    def get(url : String, params = {} of String => String)
      params = HTTP::Params.encode(params.merge({"key" => api_token}))
      HTTP::Client.get("#{base_uri}/#{url}.json?#{params}").body
    end

    def post(url : String, body = {} of String => String)
      params = HTTP::Params.encode({key: api_token})
      HTTP::Client.post("#{base_uri}/#{url}.json?#{params}", headers: HTTP::Headers{"Content-Type" => "application/json"}, body: body.to_json)
    end
  end
end