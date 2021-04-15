#!/usr/bin/env ruby
require 'bundler/inline'
require 'yaml'
require 'pp'

gemfile do
  source 'https://rubygems.org'
  gem 'bibtex-ruby', '~> 6'
  gem 'nokogiri', '~> 1.11'
  gem 'text', '~> 1.3'
end

# in_html = File.readlines('articles.txt').map { |entry|
#   entry.downcase.gsub("'", '')
# }.sort.uniq

# File.open("articles2.txt", "w") do |f|
#   f.puts(in_html)
# end

in_html = File.readlines('articles2.txt').map { |entry|
  entry.downcase.gsub("'", '')
}.sort
in_bib = BibTeX.open('content/aloni.bib').map { |entry|
  entry.title.downcase.gsub("'", '')
}.sort

matching = Array.new()
non_matching = Array.new()
in_bib.each { |bib_entry|
  matched = false
  in_html.each { |html_entry|
    if bib_entry.include?(html_entry) || html_entry.include?(bib_entry)
      matching << bib_entry
      matched = true
    end
  }
  non_matching << bib_entry unless matched
}

File.open("matching.txt", "w") do |f|
  f.puts(matching.sort.uniq)
end

File.open("non_matching.txt", "w") do |f|
  f.puts(non_matching.sort.uniq)
end


# def add(bib, entry)
#   entry.delete('date-added')
#   entry.delete('date-modified')
#   bib << entry
#   bib
# end

#:parse_names parser option to false.
#BibTeX.parse(<<-END).to_xml(:extended => true)

# saved = BibTeX::Bibliography.new
# bib.each { |bib_entry|
#   if !bib_entry.author.nil? && bib_entry.author.downcase.include?('aloni')
#     saved = add(saved, bib_entry)
#   end
# }
# saved.save_to('aloni_web.bib',  :parse_names => false)

# html_entries.each { |html_entry|
#   puts html_entry
#   closest = bib_entries.map { |bib_entry|
#     {
#       'value' => bib_entry,
#       'distance' => Text::Levenshtein.distance(html_entry, bib_entry)
#     }
#   }.sort_by { |hsh| hsh['distance'] }.first['value']
#   puts '--'
#   puts closest
#   puts
#   puts
# }
# html = Nokogiri::HTML(File.read(ARGV[0]))
# html_entries = html.xpath('//li/a').map { |node|
#   node.text
# }
# puts html_entries
