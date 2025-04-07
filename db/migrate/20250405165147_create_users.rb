class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name, null: false
      t.string :email_address, null: false, index: { unique: true }
      t.string :password, null: false
      t.timestamps
    end

    change_column :users, :created_at, :timestamptz
    change_column :users, :updated_at, :timestamptz

    change_column_default :users, :id, -> { 'uuid_generate_v4()' }
    change_column_default :users, :created_at, -> { 'now()' }
    change_column_default :users, :updated_at, -> { 'now()' }
  end
end
