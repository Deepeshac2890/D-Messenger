module ApplicationHelper
  def gravatar_for(user, options = { size: 80})
    image_tag(gravatar_link(user.email.downcase, options), class: "rounded shadow mx-auto d-block")
  end

  def gravatar_link(email, options = { size: 80})
    hash = Digest::MD5.hexdigest(email)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def same_user_or_admin(user)
    current_user == user || current_user.is_admin
  end

  def logged_in?
    !!current_user
  end
end
