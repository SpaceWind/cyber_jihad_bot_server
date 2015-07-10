class AdminApiController < ApplicationController

	def promote
		user = User.find_by login: params[:login]
		if (user)
			user.group = 'admins'
			user.save
			result = {'success' => true, 'status' => 'OK'}
			render json: result
		else
			result = {'success' => false, 'status' => "user" + params[:login] + " does not exists"}
			render json: result
		end
	end
	
	def check
		user = User.find_by login: params[:login]
		if (user)
			if (user.group == 'admins')
				result = {'success' => true, 'status' => 'OK'}
				render json: result
			else
				result = {'success' => false, 'status' => 'User is not admin'}
				render json: result
			end
		else
			result = {'success' => false, 'status' => 'User does not exists'}
			render json: result
		end
	end
	
end