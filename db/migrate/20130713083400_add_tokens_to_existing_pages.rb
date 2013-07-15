class AddTokensToExistingPages < ActiveRecord::Migration
  def change
    Poster.find_each do |page|
      page.save
    end
  end
end
