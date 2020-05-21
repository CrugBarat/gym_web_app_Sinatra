require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/instructor.rb')

#INDEX
get '/admin/instructors' do
  @instructors = Instructor.all()
  erb(:"admin/instructors/index")
end

#NEW
get '/admin/instructors/create' do
  erb(:"admin/instructors/create")
end

#CREATE
post '/admin/instructors' do
  @new_instructor = Instructor.new(params)
  @new_instructor.save()
  erb(:"admin/instructors/success")
end

#SHOW
get '/admin/instructors/:id' do
  id = params['id'].to_i
  @instructor = Instructor.find_by_id(id)
  erb(:"admin/instructors/show")
end

#EDIT
get '/admin/instructors/:id/edit' do
  id = params['id'].to_i
  @instructor = Instructor.find_by_id(id)
  erb(:"admin/instructors/edit")
end

#UPDATE
post '/admin/instructors/:id' do
  id = params['id']
  instructor = Instructor.new(params)
  instructor.update()
  redirect('/admin/instructors/' + id )
end
