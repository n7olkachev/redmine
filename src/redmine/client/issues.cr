module Redmine
  class Client
    class Issues
      getter client : Client

      def initialize(@client)
      end

      def find(issue_id)
        response = client.get("issues/#{issue_id}")
        Issue.from_json(response, "issue")
      end

      def all(params = {} of String => String)
        response = client.get("issues", params)
        Array(Issue).from_json(response, "issues")
      end

      def assigned_to(id)
        all({"assigned_to_id" => id})
      end

      def assigned_to_me
        assigned_to "me"
      end
    end
  end
end