# Exploring Kenyan Education

Welcome to the Exploring Kenyan Education site. 

This is the public repository for the site: <http://developmentseed.org/kenya-bank/>

![](https://github.com/developmentseed/kenya-bank/raw/gh-pages/img/kenya-front.png)

## Documentation 

This documentation is divded into two parts. The first section covers how to set up github and fork the project, and explains the site architecture with file descriptions. The second section backs up to data processing and map design by providing links to tools to download, and docs for working with SQLite and Tilemill. 

## Github and Site Architecture

### Setting up Github
 - [Create an account](https://github.com/signup/free)
 - [Set up Git](http://help.github.com/mac-set-up-git/)
 - [Forking a repository](http://help.github.com/fork-a-repo/)


### Forking the project
To use this project as a starting point, [fork the repository](http://help.github.com/fork-a-repo). This will create a new copy of the project on github. Make changes by setting up a local repo by cloning it to the file or directory that you desire, and then from there you can make changes and commit/push them to github. For example, I have a local github folder that I navigate to with `cd Documents/github/` to clone all github projects. Then i navigate into the specific project to commit and push changes. 

### Files
-----

#### GH-pages branch

    _layouts       Major page templates.
    _posts         Content. Data for open data page, sources, about.
    css            CSS stylesheets
    ext            javascript libraries (that are not modified at all for site)
    fonts          Fonts.
    img            Images.
    js             Javascript that is custom for site - where map layers and text are inserted 
    README.md      This file.
    _config.yml    Jekyll configuration file.
    index.html     Home page.
    
### Master branch     
    
    data           all data used in TileMill projects
    img            all images used in TileMill projects
    tilemill       Kenya-Bank tilemill projects.


### Jekyll
The site uses Jekyll, a simple, logic aware, static site generator. In a nutshell you build a site with all the logic and source files you need and Jekyll creates a static copy of the website in a `_site/` directory. Note that you do not touch the contents of this directory. You make any additions or changes to the files outside of this.

Make sure you have [Xcode](https://developer.apple.com/technologies/tools/) installed before installing Jekyll. This is available for free in the Apple App store.  Once this is complete you should be able to run: 

- `gem install jekyll`

If this doesn't work, read documentation [available here](https://github.com/mojombo/jekyll/wiki/install) about updating your ruby packages.

Once jekyll is installed, and you have downloaded the project, from terminal, navigate into the directory the project is in and type 'jekyll'. Locally, the site can be viewed at `http://0.0.0.0:4000/index.html` in any browser after it has been generated for the first time. This allows you to make local changes that are automatically reflected in your local version of the site, as long as jekyll is running in your terminal. To stop jekyll, type 'command c'.

#### Site Configuration
`_config.yml` sets up the default configuration for jekyll when reading all files. As seen below, it allows you to format the url, and allows for the exclusion of unnecessary files that jekyll doesn't need to generate.

		auto: true
		server: true
		exclude:
		  - README.md
		  - import.rb
		  - tilemill
		permalink: /:title
		baseurl: /internews-media

#### Adding new pages
Jekyll allows for easy referencing and adding logic for other pages in the header of each new page that you create. For our use case, in `0200-01-02-about.html`, the header includes several options:

		title: About the Data
		category: about
		tags: about
		layout: pages

We reference posts with 'tags' and 'category' to control their display from the template pages located in `_layouts/`. The logic contained in these template files uses Liquid. You can learn more about the [Liquid Templating System](https://github.com/shopify/liquid/wiki/liquid-for-designers) for more information on creating relationships between files in the `_site` directory.

#### Naming conventions
Jekyll has a default chronological pagination system. Posts are ordered such that the most _recent_ post appears first, so we created fake dates to ensure hierarchy between the 'About' and 'Sources' links in the \_posts directory.

    hierarchy    file name
    --------     ---------
     1           0200-01-02-about.html
     2           0200-01-01-data.html
     2           0200-01-01-sources.html

### Notes
Where something requires explanation there are inline notes in the code.

## TileMill + Data Processing 

After you have cloned or downloaded the repository, find where you saved the `tilemill` folder, and point your TileMill to this location in the setting tab: 

![](https://img.skitch.com/20120628-9xb3u6if563m3k6tt5nbkyqke.png)

If you're working with a cloned version of the site with git, makes sure that you're looking at the branch master by navigating to the project location in the terminal, then typing `git checkout master`.

![](https://img.skitch.com/20120628-pkts8e5snk4tx6h1iwe7qrd2qy.png)

All of the TileMill projects are set up to point to the data, also in the master branch. So you will not need to worry about editing the Sqlite databases, however see below for more information about the joins that are happening between Sqlite files in TileMill. 

##### Uploading maps

First, set up your TileMill to sync with your MapBox account. Then within any project, after making your desired changes, click upload, and the map layer will be pushed to the server with the name of the project folder. Unless you manually change the project folder name from your documents window, this will stay the same, and thus replace the corresponding map layer on your wb-education MapBox account. Create your own free account to upload tiles without making changes to the site. 

Authorizing Sync 
![](https://img.skitch.com/20120628-1u1gu7jte2rgb3pjxtjbdnphdc.png)

Uploading

![](https://img.skitch.com/20120628-dm5d2b1ef7mjrus6r9dw5sbu2m.png)

### Working with Sqlite

[This tutorial](http://mapbox.com/tilemill/docs/tutorials/sqlite-work/) walks through turning data sources into SQLite files. This requires downloading [Quantum GIS](www.qgis.org), and [Tilemill](www.tilemill.com).

Qgis is a powerful tool for working with geographic files, but for right now we just want it to convert data formats like csvs and shapefiles into SQLite databases. 

SQLite databases are the best tool for sorting data in Tilemill. SQLite lets you change the query on the data whenever you like, to find a different angle on your data. It is also an easy way to join databases with geographic information to those without geographic information, in the `attach db` field of the `add SQLite layer` in Tilemill. This process is outlined in the same [tutorial](http://mapbox.com/tilemill/docs/tutorials/sqlite-work/) as above, and can be seen in any of the Kenya-bank projects: 

![](https://img.skitch.com/20120628-g3c5rbu74y1yaaiftxseuewusj.png)


Since I have my education factors at the county level, I need shapes that correspond to each county. So I navigate to the `Kenya_counties.sqlite`.

Then in the `attach DB` field, you will navigate to the file `Kenya_Database.sqlite`, which has all of the education factors I want to visualize. The join between these two databases happens in the query field, and looks similar to this. The asterisk means select all, and the round(ptr_secondary) is rounding the number, finally the join is made on the key `county`, which is contained in both databases.

            (Select
             a.*,
             b.*,
            round(ptr_secondary) as ptr_secondary_r
            from kenya_county a
            left outer join secondary_indicators b on lower(a.county) = lower(b.County)
            )
			

## Map Design 

This comes much easier, as it follows a css-type like language called carto. All of the basics and more advanced options of styling your data can be found in the [mapbox.com/help](http://mapbox.com/help), starting with [styling data](http://mapbox.com/tilemill/docs/crashcourse/styling/) section.


## Further Support
There are many more tutorials on data processing and TileMill at [guides](http://mapbox.com/tilemill/docs/guides/add-shapefile/) and [support discussions](http://support.mapbox.com/discussions/tilemill). Please contact us as well if you get stuck!
