#! /usr/bin/ruby

puts "Input topic name:"

name = gets.chomp

cur_path = Dir.pwd

puts "Current path: #{cur_path}"

# 遍历当前文件夹，取出目前最大的topic数
max = 0
Dir.foreach(cur_path) do |x|
    if x == '.' or x == '..'
        next
    end
    if File.directory?(cur_path + "/#{x}") and x.match('topic*')
        #topic-
        n = x[6,1]
        if n.to_i > max.to_i 
            max = n
        end
    end
end

target_dir_path = cur_path + "/topic-#{max.to_i+1}：#{name}"
Dir.mkdir(target_dir_path)

puts "Create dir named: #{name} success!"

if not File.exist?(target_dir_path + '/MyPlayground.playground')
    f=File.new(target_dir_path + '/MyPlayground.playground', 'w+')
    puts "Create file MyPlayground.playground"
end

if not File.exist?(target_dir_path + '/README.md')
    f=File.new(target_dir_path + '/README.md', 'w+')
    puts "Create file README.md"
end

