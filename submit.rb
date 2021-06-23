
#! /usr/bin/ruby

system('git status')
puts "----> Start upload to github"
system('git add .')

cur_path = Dir.pwd + '/topics/'

max = 0
name = 'topic-?'
Dir.foreach(cur_path) do |x|
    if x == '.' or x == '..'
        next
    end
    if File.directory?(cur_path + "/#{x}") and x.match('topic*')
        #topic-x：
        topic = x.split('：').first
        n = topic.sub('topic-', '')
        if n.to_i > max.to_i 
            max = n
            name = x
        end
    end
end

system("git commit -m 'submit: #{name}'")
system("git pull --rebase && git push origin main")