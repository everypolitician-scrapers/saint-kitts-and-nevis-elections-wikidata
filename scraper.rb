#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

page_names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/saint-kitts-and-nevis-elections-wikipedia', column: 'wikiname')
cat_names = WikiData::Category.new('Category:Members of the National Assembly (Saint Kitts and Nevis)', 'en').member_titles

sparq = 'SELECT ?item WHERE { ?item wdt:P39 wd:Q21295997 . }'
p39s  = EveryPolitician::Wikidata.sparql(sparq)

EveryPolitician::Wikidata.scrape_wikidata(ids: p39s, names: { en: page_names | cat_names })
