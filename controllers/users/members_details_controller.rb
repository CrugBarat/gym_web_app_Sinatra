require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/member.rb')
require_relative('../../models/member_details.rb')

#NEW
get '/users/members/:id/member_details/create' do
  id = params['id'].to_i
  @member = Member.find_by_id(id)
  erb(:"users/members_details/create")
end

#CREATE
post '/users/members/:id/member_details' do
  id = params['id'].to_i
  new_params = params.merge!(member_id: id)
  new_member_details = MemberDetails.new(new_params)
  new_member_details.save()
  redirect('/users/members/' + params['id'])
end

#SHOW
get '/users/members/:id/member_details/show' do
  id = params['id'].to_i
  @member = Member.find_by_id(id)
  @member_details = MemberDetails.find_by_member_id(id)
  erb(:"users/members_details/show")
end
