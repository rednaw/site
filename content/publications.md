---
title: Publications
header: Publications
layout: default
permalink: /publications
---

<h4>Proceedings</h4>
{% bibliography -f content/aloni.bib --query @inproceedings %}

<h4>Articles</h4>
{% bibliography -f content/aloni.bib --query @article %}

<h4>Collections</h4>
{% bibliography -f content/aloni.bib --query @incollection %}




