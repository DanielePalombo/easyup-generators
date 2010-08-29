<div id="login">
  <%% form_for @<%= file_name %>_session, :url => <%= file_name %>_sessions_path do |f| %>

    <%% if @<%= file_name %>_session.errors.any? %>
      <div id="error_explanation">
        <ul>
        <%% @<%= file_name %>_session.errors.full_messages.each do |msg| %>
          <li><%%= msg %></li>
        <%% end %>
        </ul>
      </div>
    <%% end %>

    <%%= f.label :email %><br />
    <%%= f.text_field :email %><br />
    <br />
    <%%= f.label :password %><br />
    <%%= f.password_field :password %><br />
    <br />
    <%%= f.check_box :remember_me %><%%= f.label :remember_me %><br />
    <br />
    <%%= f.submit "Login" %>
  <%% end %>
</div>