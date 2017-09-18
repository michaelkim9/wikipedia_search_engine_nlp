# Building Wikipedia Search Engine with Semantic Analysis

This project has three parts: data collection, data exploration / algorithm development, then finally predictive modeling.

It accomplishes two main tasks: recommend Wikipedia articles, and predict categories of new articles. A user can input a search term and my search engine algorithm will recommend 5 related Wikipedia articles for the user. When a new article is submitted to Wikipedia, my model can predict with over 90% accuracy the correct category it falls under.

**tools used:**
Natural Language Processing (NLP), Machine Learning Algorithms, Python, Pandas, PostGres, Scikit-Learn, Wikipedia API, Docker, AWS

![](http://interactive.blockdiag.com/image?compression=deflate&encoding=base64&src=eJxdjrsOwjAMRXe-wlsmRhaQkDoiMSDxBW5slahtHDmGCiH-nfQxtKy-59zruhPfUsAGPjsA56XvMdIRSIbYCZKD_RncENqQuGBQ3S7TidCwxsynjZUZ1T8m4HqvJlXZnhrBJMHBbWlTDHEeSFravYUXQy_E3TKrwbioMKb5z16UmRxfXZurVY_GjegbhqJIjaXm-wNmzE4W)

## Infrastructure

Utilized docker-compose to build the project.

### Part 1 -- Collection

Queried the wikipedia API and **collected all of the articles** under the following wikipedia categories:

* [Machine Learning](https://en.wikipedia.org/wiki/Category:Machine_learning)
* [Business Software](https://en.wikipedia.org/wiki/Category:Business_software)

The code is modular enough that any valid category from Wikipedia can be queried by your code. Accessed the Wikpedia API to collect 8000+ articles.

The results of the query were written to PostgreSQL tables, `page` and `category`. And a `pages_categories` table was developed to build a reference between the pages and categories. This is the case because a page can have many categories and a category can have many pages. 

### Part 2 -- Search

Used Latent Semantic Analysis to search all the pages. Given a search query, the algorithm developed will find the top 5 related articles to the search query based on cosine similarities. 

### Part 3 -- Predictive Model

In this part, we build a predictive model from the data we've just indexed. Specifically, when a new article from wikipedia comes along, we would like to be able to predict what category the article should fall into. Implemented KNearest Neighbors (KNN), Support Vector Classifier and Multinomial Naive Bayes to obtain a 90% prediction accuracy for classifying articles.

