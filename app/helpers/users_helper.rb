module UsersHelper

  def check_connection(provider)
    if current_user.has_connection_with(provider)
      html = link_to(disconnect_path(social: provider.downcase), class: "btn btn-#{provider.downcase} btn-block btn-social") do
        content_tag(:i, '', class: "fa fa-#{provider.downcase}") + 'Successfully Verified'
      end
    else
      html = link_to user_omniauth_authorize_path(provider: provider.downcase), class: "btn btn-#{provider.downcase} btn-block btn-social" do
        content_tag(:i, '', class: "fa fa-#{provider.downcase}") + "Verify your Account"
      end
    end
  end
end
