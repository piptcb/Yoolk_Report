class Listing < ActiveRecord::Base
  def self.postal_codes
    where("postal_code IS NOT NULL and postal_code != ?", "").pluck(:postal_code).uniq
  end

  def self.total_listing_for_region(postal_code)
    where("postal_code = ?",postal_code).count
  end
end
