class Gossip
	attr_accessor :author, :content

	def initialize (author, content)
		@author = author
		@content = content
	end # end méthode "initialize"

	def save
		CSV.open("./db/gossip.csv", "ab") do |csv|
			csv << [@author, @content]
		end #end de "CSV.open do"
	end # end méthode "save"

	def self.all
	  all_gossips = []
	  CSV.read("./db/gossip.csv").each do |csv_line|
	    all_gossips << Gossip.new(csv_line[0], csv_line[1])
	  end
	  return all_gossips
	end

	def self.find(id)
		Gossip.all[id.to_i]
	end

	def update(id, author, content)
		all_gossips = CSV.read("./db/gossip.csv") do |csv|
		all_gossips[id.to_i][0] = author
		all_gossips[id.to_i][1] = content
			
			CSV.open("./db/gossip.csv", 'w') { |csv| all_gossips.each{|ligne| csv << ligne}}

			end
	end

end #end class "Gossip"

