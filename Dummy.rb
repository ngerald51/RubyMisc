class Dummy  #Create methods that are not there
  def method_missing(m)  
    puts "#{m}"  
  end  
end  
Dummy.new.anything 
Dummy.new.hey
Dummy.new.DAVIS 
