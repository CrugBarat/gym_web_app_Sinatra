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

# get '/admin/members/:id/add_details' do
#   erb(:"admin/members/add_details_member")
# end
#
# post '/admin/:id' do
#   @new_member_details = MemberDetails.new(params)
#   @new_member_details.save()
#   erb(:"admin/members/add_details_success")
# end
