class InfoapiController < ApplicationController
	
	def login
	require 'digest/sha2'
	require 'date'
		if (params[:login] == nil || params[:pass] == nil)
			result = {'success' => false, 'status' => 'incorrect user params'}
			render json: result
		else
			user = User.find_by login: params[:login], password: Digest::SHA2.hexdigest(params[:pass])
			if (user)
				new_apikey = rand(36**12).to_s(36)
				
				active_key = ActiveKey.find_by login: params[:login]
				if (active_key)
					active_key.destroy
				end
				active_key = ActiveKey.new
				active_key.apikey = new_apikey
				active_key.login = params[:login]
				active_key.last_updated = DateTime.now
				active_key.heroid = nil
				active_key.last_controlled = DateTime.now
				active_key.rolled_heroid = nil
				active_key.save
				
				result = {'success' => true, 'apikey' => new_apikey, 'group' => user.group}
				render json: result
			else
				result = {'success' => false, 'status' => 'wrong login/pass combination'}
				render json: result
			end
	end
  end
  
  def signup
  require 'digest/sha2'
	if (params[:login] == nil || params[:pass] == nil)
		result = {'success' => false, 'status' => 'incorrect user'}
		render json: result
	elsif (User.find_by login: params[:login])
		result = {'success' => false, 'status' => 'user already exists'}
		render json: result
	else
		userCount = User.count
		user = User.new
		user.login = params[:login]
		user.password = Digest::SHA2.hexdigest(params[:pass])
		user.realname = params[:realname]
		if (userCount == 0)
			user.group = 'admins'
		else
			user.group = 'players'
		end
		user.save
		result = {'success' => true, 'status'=> 'user created'}
		render json: result
	end
  end
  
  def signup_invite
  require 'digest/sha2'
	if (params[:login] == nil || params[:pass] == nil)
		result = {'success' => false, 'status' => 'incorrect user'}
		render json: result
	elsif (User.find_by login: params[:login])
		result = {'success' => false, 'status' => 'user already exists'}
		render json: result
	else
		inv = Invite.find_by data:params[:invite]
		if (inv)
			userCount = User.count
			user = User.new
			user.login = params[:login]
			user.password = Digest::SHA2.hexdigest(params[:pass])
			user.realname = params[:realname]
			if (userCount == 0)
				user.group = 'admins'
			else
				user.group = 'players'
			end
			user.save
			inv.destroy
			result = {'success' => true, 'status'=> 'user created'}
			render json: result
		else
			result = {'success' => false, 'status' => 'Wrong invite ID'}
			render json: result
		end
	end
  end
  
  def generate_invite
		success = true
		status = 'OK'
		all_invites = nil
		count = 0
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				invite = Invite.new
				invite.data = rand(36**20).to_s(36).gsub(/(.{4})(?=.)/, '\1-\2').upcase
				invite.sender = user.login
				invite.save
				all_invites = Invite.all
				count = all_invites.count
			else
				success = false
				status = 'User is not admin'
			end
		else
			success = false
			status = 'wrong api key'
		end
		result = {'success' => success, 'status' => status, 'invites' => all_invites, 'count' => count}
		render json: result
  end
  
  def userExists
	result = nil
	if (params[:login] == nil)
		result = {'success' => false, 'status' => 'Incorrect login', 'exists' => false}
	elsif (User.find_by login: params[:login])
		result = {'success' => true, 'status' => 'user already exists', 'exists' => true}
	else
		result = {'success' => true, 'status' => 'OK', 'exists' => false}
	end
	render json: result
  end
  
  def ping
	result = {'success' => true, 'status' => 'Server is UP'}
	render json: result
  end
  
end






