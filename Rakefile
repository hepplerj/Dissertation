#!/usr/bin/ruby

# Dissertation writing analytics

## Config ##
chapters = ["chap1.md", "chap2.md", "chap3.md", "chap4.md", "chap5.md", "intro.md", "conclusion.md"]
draft_dir = "~/Writing/dissertation/chapters"

Dir.glob('#{draft_dir} + "*.md"') do |md_files|
  p md_files
end

## Iterate through the chapter files ##
#Dir.glob('chapters/*.md') do |md_files|
#
#end

desc "Default: List available tasks"
task :default do
  puts "Try one of these specific tasks:"
  sh "rake --tasks --silent"
end

desc "Word counts, appended to count.tsv"
task :count do
  word_count = %x(wc /Users/jheppler/Writing/dissertation/chapters/manuscript-ch3.md | awk {'print $2'})

  filename = "count.tsv"
  path = File.join("_analytics", filename)
  #if File.exists? path; raise RuntimeError.new("Path exists, won't clobber #{path}."); end
  File.open(path, 'a') do |file|
    file.write <<-EOS
#{Time.now.strftime("%Y-%m-%d %H:%M")} \t #{chapter} \t #{word_count}
EOS
  end
end

desc "Target word count list"
task :targets do

  target_count = %x(wc /Users/jheppler/Writing/dissertation/chapters/manuscript-ch3.md | awk {'print $2'}).to_f
  chapter_target = 10000.to_f
  percent_complete = ((target_count/chapter_target)*100).to_f

  filename = "target_count.tsv"
  path = File.join("_analytics", filename)
  File.open(path, 'a') do |file|
    file.write <<-EOS
#{Time.now.strftime("%Y-%m-%d %H:%M")} \t #{target_count} \t #{chapter_target} \t #{percent_complete}
EOS
  end
end

desc "Project target count"
task :project do 

  # `cat` all the chapters, divide by project target, return percentage complete
  project_count = %x(cat 'chap*' | wc | awk {'print $2'}).to_f
  project_target = 70000.to_f
  percent_complete = (project_count/project_target)*100.to_f

  filename = "project_count.tsv"
  path = File.join("_analytics", filename)
  File.open(path, 'a') do |file|
    file.write <<-EOS
date \t project_count \t target_count
#{Time.now.strftime("%Y-%m-%d %H:%M")} \t #{project_count} \t #{target_count} \t #{percent_complete}
EOS
  end
end
