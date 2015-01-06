class PostPolicy < ApplicationPolicy
  def create?
    true
  end

  def permitted_attributes
    %i(email username password)
  end
end
