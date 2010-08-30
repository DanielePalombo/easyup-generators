module Authentication
  module <%= class_name %>

    private

    def current_<%= file_name %>_session
      return @current_<%= file_name %>_session if defined?(@current_<%= file_name %>_session)
      @current_<%= file_name %>_session = <%= class_name %>Session.find
    end

    def current_<%= file_name %>
      return @current_<%= file_name %> if defined?(@current_<%= file_name %>)
      @current_<%= file_name %> = current_<%= file_name %>_session && current_<%= file_name %>_session.record
    end

    def require_<%= file_name %>
      unless current_<%= file_name %>
        flash[:notice] = "You must be logged in to access this page"
        redirect_to :back
        return false
      end
    end

    def require_no_<%= file_name %>
      if current_<%= file_name %>
        flash[:notice] = "You must be logged out to access this page"
        redirect_to :back
        return false
      end
    end

  end
end
