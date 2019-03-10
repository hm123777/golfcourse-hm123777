class CoursesController < ApplicationController
  before_action :require_user_logged_in

  def new
    @courses = []

    @keyword = params[:keyword]
    if @keyword.present?
      results = RakutenWebService::Gora::Course.search({
        keyword: @keyword,
        imageFlag: 1,
        hits: 20,
      })

      results.each do |result|
        course = Course.new(read(result))
        @courses << course
      end
    end
  end

  private

  def read(result)
    api_courseid = result['golfCourseId']
    api_coursename = result['golfCourseName']
    api_coursereserve_url = result['reserveCalUrl']
    api_courseimage_url = result['golfCourseImageUrl']

    {
      api_courseid: api_courseid,
      api_coursename: api_coursename,
      api_coursereserve_url: api_coursereserve_url,
      api_courseimage_url: api_courseimage_url,
    }
  end
end