class CreateProjectHistories < ActiveRecord::Migration[8.0]
  def change
    create_table :project_histories, id: :uuid do |t|
      t.references :project, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.json :metadata, null: false, default: {}
      t.timestamps
    end

    change_column :project_histories, :created_at, :timestamptz
    change_column :project_histories, :updated_at, :timestamptz

    change_column_default :project_histories, :id, -> { 'uuid_generate_v4()' }
    change_column_default :project_histories, :created_at, -> { 'now()' }
    change_column_default :project_histories, :updated_at, -> { 'now()' }
  end
end
