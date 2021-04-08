---
title: Publications
header: Publications
layout: default
permalink: /publications
---

<h4>Journal articles</h4>
{% bibliography -f content/aloni.bib --query @article]%}

<h4>Conference papers</h4>
{% bibliography -f content/aloni.bib --query @conference || @inproceedings %}

<h4>Book chapters</h4>
{% bibliography -f content/aloni.bib --query @incollection %}

<h4>Drafts</h4>
{% bibliography -f content/aloni.bib --query @unpublished %}

<h4>PHD thesis</h4>
{% bibliography -f content/aloni.bib --query @phdthesis %}




