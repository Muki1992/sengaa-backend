module TeamSecured
  extend ActiveSupport::Concern

  def check_team_id_header
    if request.headers['team-id'].present?
      check_authorization_of_current_user(request.headers['team-id'])
    else
      render json: {errors: ['Team id missing']}, status: 400
    end
  end

  def check_authorization_of_current_user(team_id)
    membership = Membership.find_by_user_id_and_team_id(@current_user.id, team_id)
    unless membership.present? && (membership.role == 'owner' || membership.role == 'admin')
      render json: {errors: ['No admin rights']}, status: 400
    end
  end
end