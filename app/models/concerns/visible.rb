module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private', 'archived']

  included do
      validates :status, inclusion: { in: Visible::VALID_STATUSES }
  end

  def archived?
      status == 'archived'
  end
end
