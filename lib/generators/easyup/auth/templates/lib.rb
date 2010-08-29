module Authentication
  module <%= class_name %>

    private

    def current_<%= file_name %>_session
      return @current_<%= file_name %>_session if defined?(@current_<%= file_name %>_session)
      @current_<%= file_name %>_session = session_<%= file_name %>_model.find
    end

    def current_<%= file_name %>
      return @current_%= file_name %> if defined?(@current_<%= file_name %>)
      @current_<%= file_name %> = <%= class_name %>.find current_<%= file_name %>_session.record.id if current_<%= file_name %>_session
    end

    def require_<%= file_name %>_authentication
      unless current_<%= file_name %>
        flash[:notice] = "You must be logged in to access this page"
        redirect_to login_url
        return false
      end
    end

    def require_no_<%= file_name %>
      if current_<%= file_name %>
        flash[:notice] = "You must be logged out to access this page"
        redirect_to root_url
        return false
      end
    end

    def <%= file_name %>_logged_in?
      current_<%= file_name %> != nil
    end

    def <%= file_name %>_logged_out?
      current_<%= file_name %> == nil
    end

  end
end
