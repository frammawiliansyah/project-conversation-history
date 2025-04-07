class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects, id: :uuid do |t|
      t.string :title, null: false, index: { unique: true }
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :project_status, null: false, foreign_key: true, type: :uuid
      t.text :content, null: true
      t.timestamps
    end

    change_column :projects, :created_at, :timestamptz
    change_column :projects, :updated_at, :timestamptz

    change_column_default :projects, :id, -> { 'uuid_generate_v4()' }
    change_column_default :projects, :created_at, -> { 'now()' }
    change_column_default :projects, :updated_at, -> { 'now()' }
  end
end
