class OrganizationSport < ApplicationRecord
  belongs_to :organization
  belongs_to :sport
end
