module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_user
    end

    protected
    def find_user
      user = User.find_by_login(request.headers['login'])
      user
    end
  end
end
