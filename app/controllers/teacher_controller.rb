class TeacherController < ApplicationController
	def show  
    @responses = Response.all
  end
end