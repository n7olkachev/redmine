module Redmine
  class Client
    class TimeEntries
      getter client : Client

      def initialize(@client)
      end

      def create_for_issue(issue_id, hours)
        response = client.post("time_entries", {"time_entry" => {"issue_id" => issue_id, "hours" => hours}})
      end
    end
  end
end