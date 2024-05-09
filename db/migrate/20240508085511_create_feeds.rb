class CreateFeeds < ActiveRecord::Migration[7.1]

  def up
    create_table :feeds do |t|
      t.text :body
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps

    end
  end

    def down
      drop_table :feeds
    end
end

