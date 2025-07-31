# Getting started with SPARQL

## DBpedia

DBpedia is a machine-generated knowledge base. It was created mainly from Wikipedia infoboxes.
In addition to infoboxes, DBpedia also contains information from text (links in the `wikiPageWikiLink` relation).

### SPARQL Server

Virtuoso SPARQL endpoint: [https://dbpedia.org/sparql](https://dbpedia.org/sparql)

(Virtuoso is the triplestore)

### Namespaces

In addition to the standard `rdf`, `rdfs`, `owl`, and `xsd`, DBpedia uses its own:  
dbo - ontology (here is an example of the taxonomy Book \- Written\_Work \- Work)  
dbr - resource  
dbp - property  
It also uses standards such as:  
dc - Dublin Core  
dcterms - DC terms  
foaf - Friend of a Friend  
geodata - GeoNames  
vcard - VCF  
skos - Simple Knowledge Organization System  
The complete list of namespaces is here: [https://dbpedia.org/sparql/?help=nsdecl](https://dbpedia.org/sparql/?help=nsdecl)

In the queries, simply copy all possible prefixes:

```sparql
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX dbr: <http://dbpedia.org/resource/>
PREFIX dbp: <http://dbpedia.org/property/>
PREFIX dc: <http://purl.org/dc/elements/1.1/>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX geodata: <http://www.geonames.org/ontology#>
PREFIX vcard: <http://www.w3.org/2006/vcard/ns#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
```

### Ontology

When searching the DBPedia knowledge base, you need to know the names of classes and properties?

DBpedia T-Box specifies classes (e.g., Forest, CanadianFootballLeague, FictionalCharacter) and properties (e.g., highestPoint has range Place). Some things can be both a class (e.g., Colour) and a property (colour has range Colour).  

Check the classes [here](https://mappings.dbpedia.org/index.php?title=Special%3AAllPages&from=&to=&namespace=200)

Check the properties [here](https://mappings.dbpedia.org/index.php?title=Special%3AAllPages&from=&to=&namespace=202)

A-Boxes are information about instances. Because there are so many of them, they are available for download in several files (according to the type of statement and language). For example, the type statement is:
```<http://dbpedia.org/resource/Bochum> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://dbpedia.org/ontology/PopulatedPlace>.```

The T-Box is important for formulating queries.

## Queries in SPARQL

Until you fine-tune your query, always use LIMIT.

### Simple queries

1. Let's try to find some books.  
```sparql
   SELECT ?book WHERE {  
          ?book a dbo:Book .  
   } LIMIT 100
```
2. Click on any result and view the page from DBpedia.  
3. View the corresponding page from Wikipedia.  
4. Return to the page in DBpedia, find any property of the book (most likely in the dbp, dbo, or dc namespace) and copy its name.

### More complex queries (graph with more than one edge):

1. In the SPARQL endpoint, extend the query with the property you found earlier.  
2. Name the variable appropriately.  
```sparql
   SELECT ?book WHERE {  
          ?book a dbo:Book .  
          ?book <your property> ?your_variable .  
   } LIMIT 100
```
3. What values does `?your_variable` contain? Are they URIs or literals?

### Queries with `count()` and `DISTINCT`

1. Let's take the following query:  

```sparql
   SELECT ?book  
   WHERE {  
          ?book a dbo:Book .  
          ?book dbo:author ?author .  
          ?book dbp:releaseDate ?date .  
          ?author rdfs:label ?author_name .  
          ?book rdfs:label ?title .  
   }
```  

2. Try the query with a limit. What do you see?  
3. Add DISTINCT (`SELECT DISTINCT ?book…`)  
4. Modify the original query so that it counts how many results it returns (note: there must be no `LIMIT`)  
5. Add DISTINCT to the query (`SELECT COUNT(DISTINCT(?book))`)

### Queries with FILTER and multiple conditions

1. Try the query:  

```sparql
   SELECT ?book ?author ?pages WHERE {  
          ?book a dbo:Book .  
          ?book dbo:author ?author .  
          ?book dbp:releaseDate ?date .  
          ?book dbo:numberOfPages ?pages .  
   }  
   LIMIT 100  
```

2. Add a filter for the number of pages less than 100. Is there a book in the list that has less than 20 pages?  
3. Add a filter for the number of pages less than 100 but greater than 20.

### Queries with variable type tests

1. Try the query  

```sparql
   SELECT ?book ?date ?year  
   WHERE {  
          ?book a dbo:Book .  
          ?book dbp:releaseDate ?date .  
          BIND(year(?date) as ?year)  
   }  
   LIMIT 100  
```

2. The query will end with an error. What do you think is the cause? Try a simplified query:  

```sparql
   SELECT ?book ?date  
   WHERE {  
          ?book a dbo:Book .  
          ?book dbp:releaseDate ?date .  
   }  
   LIMIT 100  
```
3. Add a filter for the allowed value type ?date to the original query:  
```sparql
   FILTER (DATATYPE(?date) = xsd:date)  
```

### Queries with FILTER for date

1. Try the query  
```sparql
   SELECT ?book ?date   
   WHERE {  
          ?book a dbo:Book .  
          ?book dbp:releaseDate ?date .  
           FILTER(?date < "1950-01-01"^^xsd:date)  
   }  
   LIMIT 100  
```
2. Are all books really published before 1950?  
3. What could be the cause?  
4. Try modifying the query:

```sparql
SELECT ?book ?date   
   WHERE {  
          ?book a dbo:Book .  
          ?book dbp:releaseDate ?date .  
           FILTER(xsd:date(?date) < "1950-01-01"^^xsd:date)  
   }  
   LIMIT 100  
```

5. What is the problem? What type are the different values of the variable ?date?  
6. The final query must contain both the conversion of the variable ?date to the type xsd:date and the specification of the literal.  

```sparql
   SELECT ?book ?date   
   WHERE {  
          ?book a dbo:Book .  
          ?book dbp:releaseDate ?date .  
           FILTER (DATATYPE(?date) = xsd:date)  
           FILTER(xsd:date(?date) < "1950-01-01"^^xsd:date)  
   }  
   LIMIT 100
```

### Namespaces

`dbo` is the namespace for high quality data in the DBPedia ontology. Example relation in `dbo` is `dbo:birthDate`. If the day of birth was written in a correct way and extracted correctly, it is in the `dbo`. In all other cases, it is in the `dbp`, e.g. `dbp:birthDate`, `dbp:dateOfBirth`, and maybe more. `dbp` is used for automatically extracted raw infoboxes.

`dbr` is used for the instances. 


## Wikidata

Wikidata uses Q-items, P- and L- as identifiers. As a result, queries are not immediately understandable. However, the Wikidata query editor also displays entity names, so it is possible to understand the query. Formulating the query is a little more difficult.

The SPARQL endpoint is at [https://query.wikidata.org/](https://query.wikidata.org/)

### Basic queries

1. Try the query:  
```sparql
   SELECT ?authorLabel ?bookLabel ?date  
   WHERE {  
     ?book wdt:P31 wd:Q47461344 .  
     ?book wdt:P50 ?author .  
     ?book wdt:P577 ?date .  
     ?book rdfs:label ?bookLabel .  
     ?author rdfs:label ?authorLabel .  
     }  
   LIMIT 100  
```
2. Modify the query so that only German book titles and German author names are displayed.  
3. For a more general language specification, you can use `langMatches`:  
```sparql
     FILTER(langMatches(lang(?bookLabel), 'de'))  
     FILTER(langMatches(lang(?authorLabel), 'de'))
```

### Query with OPTIONAL

1. Try the query:  
```sparql
   SELECT ?authorLabel ?bookLabel ?date ?image  
   WHERE {  
     ?book wdt:P31 wd:Q47461344 .  
     ?book wdt:P50 ?author .  
     ?book wdt:P577 ?date .  
     ?book rdfs:label ?bookLabel .  
     ?author rdfs:label ?authorLabel .  
     FILTER(langMatches(lang(?bookLabel), 'en'))  
     FILTER(langMatches(lang(?authorLabel), 'de'))  
     ?book wdt:P18 ?image .  
     }  
   LIMIT 100
```
2. Modify the query to display books that have an image, but also those that do not.


### SPARQL extension for Wikidata

1. Try the query:
```sparql
   SELECT ?authorLabel ?bookLabel ?date ?image  
   WHERE {  
     ?book wdt:P31 wd:Q47461344 .  
     ?book wdt:P50 ?author .  
     ?book wdt:P577 ?date .  
     ?book rdfs:label ?bookLabel .  
     ?author rdfs:label ?authorLabel .  
     FILTER(langMatches(lang(?bookLabel), 'de'))  
     FILTER(langMatches(lang(?authorLabel), 'de'))  
     ?book wdt:P18 ?image .  
     }  
   LIMIT 100  
```
2. Add `#` - before the query in SPARQL to open the visualization option  
3. Select `#defaultView:Timeline`  
4. Select other display types (not all will be relevant for this query)


### Negation

6. Add negation to the query:  
```sparql
   SELECT ?authorLabel ?bookLabel ?genre ?genreLabel  
   WHERE {    
     SERVICE wikibase:label { bd:serviceParam wikibase:language "en". }    
     ?book wdt:P31 wd:Q47461344 .  
     ?book wdt:P50 ?author .  
     ?book wdt:P136 ?genre .  
     ?author rdfs:label ?authorName .  
     FILTER(CONTAINS(?authorName, "Tolkien")).  
   }   
   LIMIT 100
```
7. Did any of the Tolkiens write a book other than fantasy?

### List of classes and list of properties

Search classes at the Wikidata web page

https://prop-explorer.toolforge.org/
