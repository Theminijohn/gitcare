module UsersHelper

  def check_connection(provider)
    if current_user.has_connection_with(provider)
      html = link_to disconnect_path(social: provider.downcase), class: "btn btn-default btn-block" do
        content_tag :span, ' Verified', class: "fa fa-#{provider.downcase}"
      end
    else
      html = link_to user_omniauth_authorize_path(provider: provider.downcase), class: "btn btn-default btn-block" do
        content_tag :span, ' Click to verify', class: "fa fa-#{provider.downcase}"
      end
    end
  end

end
