require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/member.rb')

#INDEX
get '/admin/members' do
  @members = Member.all()
  erb(:"admin/members/index")
end

#NEW
get '/admin/members/create' do
  erb(:"admin/members/create")
end

#CREATE
post '/admin/members' do
  @new_member = Member.new(params)
  @new_member.save()
  redirect('/admin/members/' + @new_member.id.to_s + '/member_details/create')
end

#SHOW
get '/admin/members/:id' do
  id = params['id'].to_i
  @member = Member.find_by_id(id)
  erb(:"admin/members/show")
end

#EDIT
get '/admin/members/:id/edit' do
  id = params['id'].to_i
  @member = Member.find_by_id(id)
  erb(:"admin/members/edit")
end

#UPDATE
post '/admin/members/:id' do
  id = params['id']
  member = Member.new(params)
  member.update()
  redirect('/admin/members/' + id + '/member_details/edit')
end
