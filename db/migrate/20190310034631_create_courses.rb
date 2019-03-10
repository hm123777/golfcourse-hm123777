class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :api_courseid
      t.string :api_coursename
      t.string :api_coursereserve_url
      t.string :api_courseimage_url

      t.timestamps
    end
  end
end
