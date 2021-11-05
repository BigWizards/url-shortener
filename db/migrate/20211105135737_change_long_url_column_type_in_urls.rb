class ChangeLongUrlColumnTypeInUrls < ActiveRecord::Migration[6.1]
  def change
    change_column :urls, :long_url, :text
  end
end
