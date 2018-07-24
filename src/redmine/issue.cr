require "json"

module Redmine
  class Issue
    JSON.mapping(
      id: UInt64,
      subject: String,
      description: String,
      status: Status,
      project: Project
    )

    class Status
      JSON.mapping(
        id: UInt64,
        name: String
      )
    end

    class Project
      JSON.mapping(
        id: UInt64,
        name: String
      )
    end

    class Check
      JSON.mapping(
        id: UInt64,
        subject: String,
        done?: {type: Bool, default: false, key: "is_done"},
      )
    end
  end
end