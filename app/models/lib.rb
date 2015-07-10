class Lib < ActiveRecord::Base
	def self.getHeroDesc(statPrefix, genderPrefix, value)
		result_text = ''
		if (value <= 3)
			str_text = Lib.find_by token:'heroDesc', item: genderPrefix + statPrefix + ':-2'
			result_text += str_text.value
		else
			if (value >=4 && value <=6)
				str_text = Lib.find_by token:'heroDesc', item: genderPrefix + statPrefix + ':-1'
				result_text += str_text.value
			else
				if (value >= 7 && value <=9)
					str_text = Lib.find_by token:'heroDesc', item: genderPrefix + statPrefix + ':0'
					result_text += str_text.value
				else
					if (value >= 10 && value <=13)
						str_text = Lib.find_by token:'heroDesc', item: genderPrefix + statPrefix + ':1'
						result_text += str_text.value
					else
						if (value >= 14 && value <=18)
							str_text = Lib.find_by token:'heroDesc', item: genderPrefix + statPrefix + ':2'
							result_text += str_text.value
						else
							str_text = Lib.find_by token:'heroDesc', item: genderPrefix + statPrefix + ':3'
							result_text += str_text.value
						end
					end
				end
			end
		end
		result_text
	end
	
	def self.getHeroDescMainStats(statPrefix, genderPrefix, value)
		result_text = ''
		if (value <= 45)
			hp_text = Lib.find_by token:'heroDesc', item: genderPrefix + statPrefix + ':-1'
			result_text += hp_text.value
		else
			if (value >=75)
				hp_text = Lib.find_by token:'heroDesc', item: genderPrefix + statPrefix + ':1'
				result_text += hp_text.value + ' '
			else
				result_text += ' '
			end
		end
		result_text
	end
end
