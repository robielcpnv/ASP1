class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.string :name
      t.decimal :result, null: false
      t.decimal :weight, null: false
      t.date :date, null: false
      t.references :semester, null: false, foreign_key: true
      t.references :promotion, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: { to_table: :people }
      t.references :teacher, null: false, foreign_key: { to_table: :people }
      t.timestamps
    end
  end
end
