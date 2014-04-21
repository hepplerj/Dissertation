#!/usr/bin/ruby

# Dissertation writing analytics

## Config ##
draft_dir = "/Users/jheppler/Writing/dissertation/chapters"

count_filename = "count.tsv"
target_filename = "target_count.tsv"
project_filename = "project_count.tsv"

## Iterate ##

Dir.glob("/Users/jheppler/Writing/dissertation/chapters/manuscript-*.md") do |md_files|
  #p md_files
  word_counts = %x(wc #{md_files} | awk {'print $2 $4'})
  puts word_counts

#   while md_files <= md_files
#     count_path = File.join("_analytics", count_filename)
#     File.open(count_path, 'a') do |file|
#       file.write <<-EOS
# #{Time.now.strftime("%Y-%m-%d %H:%M")} \t #{chapter} \t #{word_count}
#       EOS
#     end
#   end
#
#     while md_files <= md_files
#       target_count = %x(wc /Users/jheppler/Writing/dissertation/chapters/manuscript-ch3.md | awk {'print $2'}).to_f
#       chapter_target = 10000.to_f
#       percent_complete = ((target_count/chapter_target)*100).to_f
#
#       target_path = File.join("_analytics", target_filename)
#       File.open(target_path, 'a') do |file|
#         file.write <<-EOS
# {Time.now.strftime("%Y-%m-%d %H:%M")} \t #{target_count} \t #{chapter_target} \t #{percent_complete}
# EOS
#       end
#     end
end

#target_count = %x(wc /Users/jheppler/Writing/dissertation/chapters/manuscript-ch3.md | awk {'print $2'}).to_f
#chapter_target = 10000.to_f
#percent_complete = ((target_count/chapter_target)*100).to_f

#target_filename = "target_count.tsv"
#target_path = File.join("_analytics", target_filename)
#File.open(target_path, 'a') do |file|
#  file.write <<-EOS
#{Time.now.strftime("%Y-%m-%d %H:%M")} \t #{target_count} \t #{chapter_target} \t #{percent_complete}
#EOS
#  end
#end

# `cat` all the chapters, divide by project target, return percentage complete
#project_count = %x(cat 'chap*' | wc | awk {'print $2'}).to_f
#project_target = 70000.to_f
#percent_complete = (project_count/project_target)*100.to_f

#project_filename = "project_count.tsv"
#project_path = File.join("_analytics", project_filename)
#File.open(project_path, 'a') do |file|
#  file.write <<-EOS
#date \t project_count \t target_count
#{Time.now.strftime("%Y-%m-%d %H:%M")} \t #{project_count} \t #{target_count} \t #{percent_complete}
#EOS
#  end
#end
