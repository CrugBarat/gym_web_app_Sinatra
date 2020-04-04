require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/member.rb')
require_relative('../../models/member_details.rb')
also_reload('./models/*')


#INDEX
get '/admin/members' do
  @members = Member.all()
  # @find = Member.find_by_id(params)
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
  erb(:"admin/members/success")
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
  @members = Member.all()
  erb(:"admin/members/edit")
end

#UPDATE
post '/admin/members/:id' do
  member = Member.new(params)
  member.update()
  redirect('/admin/members/' + params['id'])
end


#CREATE
post '/admin/members/:id/add_details' do
  id = params['id'].to_i
  @member = Member.find_by_id(id)
  erb(:"admin/members/add_details")
end


post '/admin/members/add_details/:id' do
  id = params['id'].to_i
  new_params = params.merge!(member_id: id)
  new_member_details = MemberDetails.new(new_params)
  new_member_details.save()
  redirect('/admin/members/' + params['id'])
end

#SHOW
get '/admin/members/:id/contact_details' do
  id = params['id'].to_i
  @member = Member.find_by_id(id)
  @member_details = MemberDetails.find_by_member_id(id)
  erb(:"admin/members/contact_details")
end

#EDIT
post '/admin/members/:id/contact_details/edit' do
  id = params['id'].to_i
  @member = Member.find_by_id(id)
  erb(:"admin/members/edit_details")
end

#UPDATE
post '/admin/members/:id/contact_details' do
  # id = params['id'].to_i
  # new_params = params.merge!(member_id: id)
  member_details = MemberDetails.new(params)
  member_details.update()
  redirect('/admin/members/' + params['id'] + '/contact_details')
end
