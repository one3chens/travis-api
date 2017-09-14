require 'travis/yml'

class Travis::Api::App
  class Middleware
    class Yml
      attr_reader :app

      def initialize(app)
        @app = app
      end

      def call(env)
        if #env['PATH_INFO'] is `/yml` env['REQUEST_TYPE'] is 'POST'
          begin
            response = @app.call(env)

            yml(env, response, request_time)

            response
          rescue StandardError => e
            request_time = Time.now

            yml(env, [500, {}, nil], request_time, e)

            raise e
          end
        else
          return
        end
      end

      private def yml(env, response, request_time, e = nil)
        status, headers, body = response


      end

    end
  end
end
