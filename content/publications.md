---
title: Publications
header: Publications
layout: default
permalink: /publications
---

<h4>Journal articles</h4>
{% bibliography -f content/aloni.bib --query @article]%}

<h4>Conference papers</h4>
{% bibliography -f content/aloni.bib --query @inproceedings --sort_by year%}

<h4>Book chapters</h4>
{% bibliography -f content/aloni.bib --query @incollection %}




