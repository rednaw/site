## Quickstart

This project backs https://www.marialoni.org, the most important directories and files are:
- **content** All content (web text and bibliographies) goes here
- **resources** All resources (pdfs) go here
- **_include/contact.md** contact information

The other files and directories are mostly technical. These only need to be changed if the structure of the site itself needs to be changed.  Things like changing the layout, navigation, style or adding a new page or subsite.

Regular (non-structural) changes are done in three steps:
1. **Make changes** by editing content and/or adding resources.
    
    Content pages are written in Markdown, see the [basic syntax guide](https://www.markdownguide.org/basic-syntax/) for a quick overview. **Note** It is not mandatory to use Markdown, it is also fine to just write plain HTML. With some restrictions it is even possible to mix the two in one file.
2. **Preview:** in a terminal type `rake preview` and go to http://localhost:4000/.
    
    It is not mandatory but recommended to do a preview before publishing because it is possible that a small unnoticed typo causes the site generation to fail after which your changes will not be published. 
3. **Publish** in a terminal type `rake publish`.
    
    This will take care that your changes are committed to version control and your changes are made public.


## Technical overview 

This site:
- is deployed using [GitHub Pages](https://pages.github.com/)
- uses [Jekyll](https://jekyllrb.com/) as web framework
- uses [Jekyll-Scholar](https://github.com/inukshuk/jekyll-scholar#readme), a Jekyll extension for parsing BibTex files.

Publishing a Jekyll site constists of 2 steps: `build` (generate HTML) and `deploy` (publish HTML)

Out-of-the-box Jekyll with GitHub Pages only allows for fully automated publishing when using a [limited, white-listed, set of Jekyll extensions](https://pages.github.com/versions/). Sites requiring non white-listed Jekyll extensions such as Jekyll-Scholar need to implement their publishing steps themselves.

A classical way of doing that is via a CI pipeline using [Github Actions](https://docs.github.com/en/actions) or [Travis](https://travis-ci.org/). While this is easy to set up it does mean adding extra technologies with their own complexities and maintenance need. CI pipelines are indispensible tools for teams but are a bit overkill for this site (at least for now). 

Therefore this site uses the simplest possible way for publishing a Jekyll site: generate the HTML locally (on your laptop) and then push the generated HTML to a repository that contains only the generated static HTML. All logic is implemented as a series of [Rake tasks](https://github.com/ruby/rake) that run locally:
- `rake build` generates HTML
- `rake preview` generates HTML and launches a webserver for preview on [http://localhost:4000](http://localhost:4000)
- `rake publish` generates HTML and pushes it to the main branch of [https://github.com/marialoni/marialoni.github.io](https://github.com/marialoni/marialoni.github.io)