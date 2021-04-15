## Quickstart

This project backs https://www.marialoni.org,\
the two most important directories are:
- **content** All content (web text and bibliographies) goes here
- **resources** All resources (pdfs) go here

All other directories (`_layouts`, `_plugins`, `_includes`, `style`) contain technical files. These files only need to be changed in case of changes to the structure of the site itself. Things like changing the layout, navigation, style or adding a new subsite.

Regular (non-structural) changes are done in three steps:
1. **Author**: Edit content and/or add resources

  Content pages are written in markdown, see the [basic syntax guide](https://www.markdownguide.org/basic-syntax/) for a quick overview. **Note** It is not mandatory to use Markdown, it is also psooble to just write plain HTML. Within limits is is even possible to mix the two in one file (not recommended).
2. **Preview:** in a terminal type `jekyll serve` and go to http://localhost:4000/

  It is recommended to always do a preview before publishing because it is possible that a small typo causes the site generation to fail after which your changes will not be published.
3. **Publish** in a terminal type `rake publish`

  This will take care that your changes are committed to version control and your changes are made public.

## Technical background 

This site:
- is deployed using GitHub Pages (https://pages.github.com/)
- uses [Jekyll](https://jekyllrb.com/) as web framework
- uses [Jekyll-Scholar](https://github.com/inukshuk/jekyll-scholar#readme) for parsing BibTex content

