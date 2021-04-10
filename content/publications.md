---
title: Publications
header: Publications
layout: default
permalink: /publications
---

##Journal articles
{% bibliography -f content/aloni.bib --query @article]%}

##Conference papers
{% bibliography -f content/aloni.bib --query @conference || @inproceedings %}

##Book chapters
{% bibliography -f content/aloni.bib --query @incollection %}

##Drafts
{% bibliography -f content/aloni.bib --query @unpublished %}

##PHD thesis
{% bibliography -f content/aloni.bib --query @phdthesis %}




