class AddTokensToExistingPages < ActiveRecord::Migration
  def change
    Page.find_each do |page|
      page.save
    end
  end
end
