require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/member.rb')
also_reload('./models/*')


#NEW
get '/users/members/create' do
  erb(:"users/members/create")
end

#CREATE
post '/users/members' do
  @new_member = Member.new(params)
  @new_member.save()
  redirect('/users/members/' + @new_member.id.to_s + '/member_details/create')
end

#SHOW
get '/users/members/:id' do
  id = params['id'].to_i
  @member = Member.find_by_id(id)
  @member_details = MemberDetails.find_by_member_id(id)
  erb(:"users/members/show")
end
