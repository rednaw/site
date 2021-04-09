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


bib = BibTeX.open(ARGV[0])
pdfs = Dir["#{ARGV[1]}/**/*.pdf"]
pdfs.each { |pdf|
  
}

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
# html = Nokogiri::HTML(File.read('../articles.html'))
# html_entries = html.xpath('//li/a').map { |node|
#   node.text
# }