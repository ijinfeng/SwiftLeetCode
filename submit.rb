
#! /usr/bin/ruby

info = system('git status')
puts "----> #{info}"
system('git add .')

cur_path = Dir.pwd

max = 0
name = 'topic-?'
Dir.foreach(cur_path) do |x|
    if x == '.' or x == '..'
        next
    end
    if File.directory?(cur_path + "/#{x}") and x.match('topic*')
        #topic-
        n = x[6,1]
        if n.to_i > max.to_i 
            max = n
            name = x
        end
    end
end

system("git commit -m 'submit: #{name}'")
system('git push origin main')