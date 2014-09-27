#!/usr/bin/env ruby

require "git"
require "csv"

data = []
repo = Git.open(Dir.pwd)

repo.log(10000).each do |commit|
  repo.checkout(commit)
  date = commit.date
  message = commit.message
  holder = []
  wc = `wc -w *.md`
  wc.split("\n").each {|string| holder.push string.strip.split(" ",2)}
  holder.each do |value|
    value.push date
    value.push message
    data.push value
  end
end

repo.checkout("master")

CSV.open("wordcounts.csv", "wb") do |csv|
  csv << ["word_count", "file", "date_time", "commit_message"]
  data.each do |row|
    csv << row
  end
end
