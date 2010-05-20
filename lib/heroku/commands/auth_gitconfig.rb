require 'shellwords'

module Heroku::Command
  class Auth < Base

    def read_credentials
      user = shell('git config heroku.account').strip
      pass = shell('git config heroku.password').strip

      if user.empty? || pass.empty?
        nil
      else
        [user, pass]
      end
    end

    def write_credentials
      shell("git config heroku.account  #{Shellwords.escape(credentials.first)}")
      shell("git config heroku.password #{Shellwords.escape(credentials.last)}")
    end

    def delete_credentials
      shell('git config --unset heroku.account')
      shell('git config --unset heroku.password')
    end

  end
end
