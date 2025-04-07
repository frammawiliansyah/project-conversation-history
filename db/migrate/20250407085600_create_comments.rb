class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.references :project, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.text :content, null: false
      t.timestamps
    end

    change_column :comments, :created_at, :timestamptz
    change_column :comments, :updated_at, :timestamptz

    change_column_default :comments, :id, -> { 'uuid_generate_v4()' }
    change_column_default :comments, :created_at, -> { 'now()' }
    change_column_default :comments, :updated_at, -> { 'now()' }
  end
end
