---
title: Articles
header: Articles
content_classes: right
layout: list
---

<style>
.csl-block {
    font-size: 16px;
}
.csl-title, .csl-author, .csl-event, .csl-editor, .csl-venue {
    display: block;
    position: relative;
    font-size: 16px;
}

.csl-title b {
    font-weight: 600;
}

.csl-content {
    display: inline-block;
    vertical-align: top;
    padding-left: 20px;
}

.no-bullet {
   list-style-type: none;
}

</style>

{% assign bib_file = '_bibliography/simple.bib' %}
{% bibliography -f {{bib_file}} --style _scholar/simple-ieee.csl --bibliography_list_tag ul %}


