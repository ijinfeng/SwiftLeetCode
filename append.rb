#！/usr/bin/ruby

require 'xcodeproj'
require_relative './log_color'
require_relative './create_proj'

# 选择一个 topic ，往其中加入新工程

append = ARGV.first
# -a 列出所有‘topic’
# -n 列出最近的一个’topic‘

if not append.nil?
    if append != '-a' and append != '-n' and append != '-o'
        puts "Unknow append character " + color_text(append, Color.red)
    
puts <<EOF
You can append a optional param with '-a' or '-n' or '-o'.
-a: list all topics
-n: list lastest topic
-o: quickly open a exist project
EOF
        exit 1
    end
end

cur_path = Dir.pwd + '/topics/'

entrys = Array.new
entrys[1] = "12"

Dir::glob("topics/topic-*") do |item|
    # topics/topic-23：Convert Sorted Array to Binary Search Tree   
    topic_string = item.split("：")
    topic_num = topic_string.first
    n = topic_num.sub('topics/topic-', '').to_i
    entrys[n-1]= "#{n}：" + topic_string.last
end

topic_name = ''
num = 0
if append == '-a'
    puts entrys

    while true do 
        puts ">>> Input a number to select a topic to insert the new project"
        num = $stdin.gets.chomp 
        if num.to_i > entrys.count
            puts "Out of range " + color_text("{1, #{entrys.count}}", Color.red)
        else
            topic_name = entrys[num.to_i - 1].split('：').last
            break
        end
    end
else
    num = entrys.last.split('：').first
    topic_name = entrys.last.split('：').last
end

puts "You will insert a new project or open a exist project in topic：" + color_text(topic_name, Color.green)

target_dir_path = cur_path + "topic-#{num}：" + topic_name

# 列出存在的工程
def listExistProj(path)
    exist_projs = Array.new
    Dir.foreach(path) do |x|
        if x.include?("My.") == true or x.include?("MyPlayground.") == true
            exist_projs << x
        end
    end
    return exist_projs
end

# 从指定路径中选出一个可用的工程 ，并打开
def pickOneProj(target_dir_path)
    exist_projs = listExistProj target_dir_path
    
    if exist_projs.count == 0
        puts color_text("No exist proj", Color.red)
       # 退出
       exit 1
    else
        puts   "------------------"
        exist_projs.each_index do |i|
           puts "#{i+1}、#{exist_projs[i]}"
        end
        
        if exist_projs.count == 1
            proj_name = exist_projs[0]
        else
            while true do
                puts "Input a number and quickly to start:"
                
                num = $stdin.gets.chomp
                if num.to_i > exist_projs.count
                    puts "Out of range " + color_text("{1, #{exist_projs.count}}", Color.red)
                else
                    proj_name = exist_projs[num.to_i - 1]
                    break
                end
            end
        end
        
        puts color_text("\nOpen proj named #{proj_name}", Color.green)
        
        system("open \"#{target_dir_path + '/' + proj_name}\"")
    end
end

if append == '-o'
    # 判断当前是否有存在的工程
    # 直接打开
    pickOneProj(target_dir_path)
    return
end

# 选择创建 playground 还是 xcodeproj
puts <<DESC

Create source code by:
1、playground
2、xcodeproj
3、openExisted

>>> Select a number to start:
DESC

proj_type = $stdin.gets.chomp

if proj_type.to_i == 3
    # 列出所有可打开的工程
    # 前缀为 'MyPlayground' or 'My' 的是有效工程
    pickOneProj(target_dir_path)
end

#create_proj(target_dir_path, proj_type)
