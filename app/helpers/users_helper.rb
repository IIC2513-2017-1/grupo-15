# frozen_string_literal: true

##
# Helper for clients
module UsersHelper
  def following_button(user)
    return unless current_user
    return if user == current_user
    following_relation = user.follower_relationships.detect do |relation|
      relation.follower_id == current_user.id
    end
    if following_relation
      button_to "Unfollow" , {:controller => :follows, :action => 'destroy', :follower_id => current_user.id, :following_id => params[:id]},
       class:"button", :method => :delete
    else
      button_to "Follow" , follows_path, method:"post", class: "button" , params: {follower_id: current_user.id, following_id:params[:id]}
    end
  end
end
