module Redmine
  class Client
    class Checklist
      getter client : Client

      def initialize(@client)
      end

      def for_issue(issue_id)
        response = client.get("issues/#{issue_id}/checklists")
        Array(Issue::Check).from_json(response, "checklists")
      end
    end
  end
end