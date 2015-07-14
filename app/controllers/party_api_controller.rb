class PartyApiController < ApplicationController
	def createParty
	require 'digest/sha2'
		success = true
		status = 'OK'
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login, group: 'admins'
			if (user)
				party = Party.find_by name:params[:party]
				if (party)
					success = false
					status = 'Party with that name already exists'
				else
					party = Party.new
					party.name = params[:party]
					party.pass = Digest::SHA2.hexdigest(params[:pass])
					party.owner = user.login
					party.save
				end
			else
				success = false
				status = 'User is not admin'
			end
		else
			success = false
			status = 'wrong api key'
		end
		result = {'success' => success, 'status' => status}
		render json: result
	end
	
	def getAccounts
		success = true
		status = 'OK'
		accounts = nil
		count = 0
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				if (params[:all] == 'y')
					accounts = SpamAccount.all
				else
					accounts = SpamAccount.where owner:user.login
				end
				if (accounts)
					count = accounts.count
				end
			else
				success = false
				status = 'User is not admin'
			end
		else
			success = false
			status = 'wrong api key'
		end
		result = {'success' => success, 'status' => status, 'accounts' => accounts, 'count' => count}
		render json: result
	end
	
	def addAccount
		success = true
		status = 'OK'
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				acc = SpamAccount.find_by owner:user.login, login:params[:login]
				if (acc == nil)
					acc = SpamAccount.new
				end
				acc.owner = user.login
				acc.login = params[:login]
				acc.pass = params[:pass]
				acc.save
			else
				success = false
				status = 'User is not admin'
			end
		else
			success = false
			status = 'wrong api key'
		end
		result = {'success' => success, 'status' => status}
		render json: result
	end
	
	def removeAccount
		success = true
		status = 'OK'
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				acc = SpamAccount.find_by owner:user.login, login:params[:login]
				if (acc)
					acc.destroy
				else
					success = false
					status = 'account not found'
				end
			else
				success = false
				status = 'User is not admin'
			end
		else
			success = false
			status = 'wrong api key'
		end
		result = {'success' => success, 'status' => status}
		render json: result
	end
	
	def markBanned
		success = true
		status = 'OK'
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				acc = AccountBan.find_by login:params[:login], channel:params[:channel]
				if (acc == nil)
					acc = AccountBan.new
				end
				acc.login = params[:login]
				acc.channel = params[:channel]
				acc.save
			else
				success = false
				status = 'User is not admin'
			end
		else
			success = false
			status = 'wrong api key'
		end
		result = {'success' => success, 'status' => status}
		render json: result
	end
	
	def removeBanned
		success = true
		status = 'OK'
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				acc = AccountBan.find_by login:params[:login], channel:params[:channel]
				if (acc)
					acc.destroy
				else
					success = false
					status = 'account not found'
				end
			else
				success = false
				status = 'User is not admin'
			end
		else
			success = false
			status = 'wrong api key'
		end
		result = {'success' => success, 'status' => status}
		render json: result
	end
	
	def banned
		success = true
		status = 'OK'
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		acc = nil
		count = 0
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				acc = AccountBan.where channel:params[:channel]
				if (acc)
					count = acc.count
				end
			else
				success = false
				status = 'User is not admin'
			end
		else
			success = false
			status = 'wrong api key'
		end
		result = {'success' => success, 'status' => status, 'accounts' => acc, 'count' => count}
		render json: result
	end
	
	def joinParty
	require 'digest/sha2'
		success = true
		status = 'OK'
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		members = nil
		party_params = nil
		pp_count = 0
		m_count = 0
		is_owner = false
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				party = Party.find_by name:params[:party], pass: Digest::SHA2.hexdigest(params[:pass])
				if (party)
					pm = PartyMember.find_by party:params[:party], member:user.login
					if (party.owner == user.login)
						is_owner = true
					end
					if (pm == nil)
						pm = PartyMember.new
						pm.party = params[:party]
						pm.member = user.login
						pm.save
					end
						
					members = PartyMember.where party:params[:party]
					if (members)
						m_count = members.count
					end
					allMembers = members
					allMembers.each {|x|
						if (x.member != user.login)
							pu = PartyUpdate.new
							pu.party = params[:party]
							pu.rec = x.member
							pu.update_type = 'join'
							pu.nick = user.login
							pu.save
						end
					}
					party_params = PartyStatus.where party:params[:party]
					if (party_params)
						pp_count = party_params.count
					end
				else
					success = false
					status = 'Cannot connect to party'
				end

			else
				success = false
				status = 'User is not found'
			end
		else
			success = false
			status = 'wrong api key'
		end
		result = {	'success' => success, 'status' => status, 'members' => members, 
					'count' => m_count, 'party_params' => party_params, 'pp_count' => pp_count, 'owner' => is_owner }
		render json: result	
	end
	
	def leaveParty
		success = true
		status = 'OK'
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				party = Party.find_by name:params[:party]
				if (party)
					pm = PartyMember.find_by party:params[:party], member:user.login
					if (pm == nil)
						success = false
						status = 'you are not at this room'
					else
						allMembers = PartyMember.where party:params[:party]
						allMembers.each {|x|
							if (x.member != user.login)
								pu = PartyUpdate.new
								pu.party = params[:party]
								pu.rec = x.member
								pu.update_type = 'leave'
								pu.nick = user.login
								pu.save
							end
						}
						pm.destroy
					end
				else
					success = false
					status = 'party is not found'
				end
			else
				success = false
				status = 'user is not found'
			end
		else
			success = false
			status = 'wrong api key'
		end
		result = {'success' => success, 'status' => status}
		render json: result
	end
	
	def changeStatus
		success = true
		status = 'OK'
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				party = Party.find_by name:params[:party]
				if (party)
					pm = PartyMember.find_by party:params[:party], member:user.login
					if (pm == nil)
						success = false
						status = 'you are not at this room'
					else
						pm.status = params[:status]
						pm.save
						
						allMembers = PartyMember.where party:params[:party]
						allMembers.each {|x|
							if (x.member != user.login)
								pu = PartyUpdate.new
								pu.nick = user.login
								pu.party = params[:party]
								pu.rec = x.member
								pu.update_type = 'status'
								pu.user_status = params[:status]
								pu.save
							end
						}
					end
				else
					success = false
					status = 'party is not found'
				end

			else
				success = false
				status = 'user is not found'
			end
		else
			success = false
			status = 'wrong api key'
		end
		result = {'success' => success, 'status' => status}
		render json: result
	end
	
	def sendMessage
		success = true
		status = 'OK'
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				party = Party.find_by name:params[:party]
				if (party)
					pm = PartyMember.find_by party:params[:party], member:user.login
					if (pm == nil)
						success = false
						status = 'you are not at this room'
					else
						allMembers = PartyMember.where party:params[:party]
						allMembers.each {|x|
							if (x.member != user.login)
								pu = PartyUpdate.new
								pu.party = params[:party]
								pu.rec = x.member
								pu.update_type = 'message'
								pu.nick = user.login
								pu.message_text = params[:m]
								pu.save
							end
						}
					end
				else
					success = false
					status = 'party is not found'
				end

			else
				success = false
				status = 'user is not found'
			end
		else
			success = false
			status = 'wrong api key'
		end
		result = {'success' => success, 'status' => status}
		render json: result
	end
	
	#/party/setparams apikey server channel cd method{list|adaptive} [before_attack{int} word_count_min word_count_max] [list_name] max_emotes caps
	
	def savePartyParams
		success = true
		status = 'OK'
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				party = Party.find_by name:params[:party]
				if (party)
					pm = PartyMember.find_by party:params[:party], member:user.login
					if (pm == nil)
						success = false
						status = 'you are not at this room'
					else
						ps = PartyStatus.find_by party:params[:party]
						if (ps == nil)
							ps = PartyStatus.new
						end
						
						ps.party = params[:party]
						ps.server = params[:s]
						ps.channel = params[:c]
						ps.cd = params[:cd]
						ps.method = params[:m]
						ps.before_attack = params[:ba]
						ps.word_count_min = params[:min]
						ps.word_count_max = params[:max]
						ps.list_name = params[:l]
						ps.max_emotes = params[:me]
						ps.caps = params[:caps]
						ps.save
					
						allMembers = PartyMember.where party:params[:party]
						allMembers.each {|x|
							if (x.member != user.login)
								pu = PartyUpdate.new
								pu.party = params[:party]
								pu.rec = x.member
								pu.update_type = 'params'
								pu.server = params[:s]
								pu.channel = params[:c]
								pu.cd = params[:cd]
								pu.method = params[:m]
								pu.before_attack = params[:ba]
								pu.word_count_min = params[:min]
								pu.word_count_max = params[:max]
								pu.list_name = params[:l]
								pu.max_emotes = params[:me]
								pu.caps = params[:caps]
								pu.save
							end
						}
					end
				else
					success = false
					status = 'party is not found'
				end

			else
				success = false
				status = 'user is not found'
			end
		else
			success = false
			status = 'wrong api key'
		end
		result = {'success' => success, 'status' => status}
		render json: result
	end
	
	def startParty
		success = true
		status = 'OK'
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				party = Party.find_by name:params[:party]
				if (party)
					pm = PartyMember.find_by party:params[:party], member:user.login
					if (pm == nil)
						success = false
						status = 'you are not at this room'
					else
						allMembers = PartyMember.where party:params[:party]
						allMembers.each {|x|
							if (x.member != user.login)
								pu = PartyUpdate.new
								pu.party = params[:party]
								pu.rec = x.member
								pu.update_type = 'start'
								pu.save
							end
						}
					end
				else
					success = false
					status = 'party is not found'
				end
			else
				success = false
				status = 'user is not found'
			end
		else
			success = false
			status = 'wrong api key'
		end
		result = {'success' => success, 'status' => status}
		render json: result
	end
	
	def stopParty
		success = true
		status = 'OK'
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				party = Party.find_by name:params[:party]
				if (party)
					pm = PartyMember.find_by party:params[:party], member:user.login
					if (pm == nil)
						success = false
						status = 'you are not at this room'
					else
						allMembers = PartyMember.where party:params[:party]
						allMembers.each {|x|
							if (x.member != user.login)
								pu = PartyUpdate.new
								pu.party = params[:party]
								pu.rec = x.member
								pu.update_type = 'stop'
								pu.save
							end
						}
					end
				else
					success = false
					status = 'party is not found'
				end
			else
				success = false
				status = 'user is not found'
			end
		else
			success = false
			status = 'wrong api key'
		end
		result = {'success' => success, 'status' => status}
		render json: result
	end
	
	def updateParty
		success = true
		status = 'OK'
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		updates_ = Array.new
		update_count = 0
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				party = Party.find_by name:params[:party]
				if (party)
					pm = PartyMember.find_by party:params[:party], member:user.login
					if (pm == nil)
						success = false
						status = 'you are not at this room'
					else
						updates = PartyUpdate.where party:params[:party], rec:user.login
						if (updates)
							update_count = updates.count
							updates.each {|x| updates_.push x}
						end
						updates.destroy_all
					end
				else
					success = false
					status = 'party is not found'
				end
			else
				success = false
				status = 'user is not found'
			end
		else
			success = false
			status = 'wrong api key'
		end
		result = {'success' => success, 'status' => status, 'updates' => updates_, 'count' => update_count}
		render json: result
	end
	
	
	def createSpamList
		success = true
		status = 'OK'
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				sl = SpamList.find_by list_name = params[:name]
				if (sl)
					success = false
					status = 'list with this name already exists'
				else
					sl = SpamList.new
					sl.list_name = params[:name]
					sl.owner = user.login
					sl.save
				end
			else
				success = false
				status = 'user is not found'
			end
		else
			success = false
			status = 'wrong api key'
		end
		result = {'success' => success, 'status' => status}
		render json: result
	end
	
	def appendSpamList
				success = true
		status = 'OK'
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				sl = SpamList.find_by list_name = params[:name]
				if (sl)
					item = SpamItem.find_by list_name = params[:name], data = params[:data]
					if (item == nil)
						item = SpamItem.new
						item.list_name = params[:name]
						item.data = params[:data]
						item.save
					else
						success = false
						status = 'item already exists'
					end
					
					
				else	
					success = false
					status = 'list is not found'
				end
			else
				success = false
				status = 'user is not found'
			end
		else
			success = false
			status = 'wrong api key'
		end
		result = {'success' => success, 'status' => status}
		render json: result
	end
	
	def removeSpamItem
		success = true
		status = 'OK'
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				sl = SpamList.find_by list_name = params[:name]
				if (sl)
					item = SpamItem.find_by list_name = params[:name], data = params[:data]
					if (item)
						item.destroy
					else
						success = false
						status = 'item was not found'
					end
					
					
				else	
					success = false
					status = 'list is not found'
				end
			else
				success = false
				status = 'user is not found'
			end
		else
			success = false
			status = 'wrong api key'
		end
		result = {'success' => success, 'status' => status}
		render json: result
	end
	
	def cleanSpamList
		success = true
		status = 'OK'
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				sl = SpamList.find_by list_name = params[:name]
				if (sl)
					item = SpamItem.find_by list_name = params[:name]
					if (item)
						item.destroy
					else
						success = false
						status = 'item was not found'
					end
					
					
				else	
					success = false
					status = 'list is not found'
				end
			else
				success = false
				status = 'user is not found'
			end
		else
			success = false
			status = 'wrong api key'
		end
		result = {'success' => success, 'status' => status}
		render json: result
	end
	
end
