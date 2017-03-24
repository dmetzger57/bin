beginning_time = Time.now

ems = ManageIQ::Providers::InfraManager.create(:name => "qesmall", :hostname => "10.8.99.224", :type => "ManageIQ::Providers::Vmware::InfraManager", :zone => Zone.default_zone)
ems.update_authentication(:default => {:userid => "root", :password => "L0ck3dout!"})
ems.authentication_check
ems.save!

end_time = Time.now
puts "#{(end_time - beginning_time)}"
