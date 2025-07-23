# Day 1: Hands-on

## RDF Grapher

- free
- https://www.ldf.fi/service/rdf-grapher

**TASK**: 

Let's have a database table:

```
| firstName | lastName | age | city   | #friends |
| --------- | -------- | --: | ------ | -------: |
| Jane      | Doe      | 26  | Bochum |      132 |
| John      | Smith    | 25  | Bochum |       25 |
```

Convert it into RDF triples. You can write it manually, using the namespace `example.org`:

```
<http://example.org/JaneDoe> <http://example.org/firstName> "Jane" .
<http://example.org/JaneDoe> <http://example.org/lastName> "Doe" .
<http://example.org/JaneDoe> <http://example.org/livesIn> <http://example.org/Bochum> .
...
```

You can easily instruct ChatGPT to create RDF triples from the table above. To obtain the format of triples, instruct the model to output **N-Triples**.

Visualize the result using [RDF Grapher](https://www.ldf.fi/service/rdf-grapher)

Don't forget to select the format in RDF Grapher (Select From format N-Triples).


## chatGPT

- free (up to some limit)
- no account needed
- https://chatgpt.com/

Feel free to instruct ChatGPT to do the tasks for you.

## OpenRefine

- free and open
- supports plugins
- https://openrefine.org/

### Installation instructions

OpenRefine needs Java to run. If you aren't sure, you can check the terminal:

```
java --version
```

You should see for example:

```
openjdk 17.0.15 2025-04-15
OpenJDK Runtime Environment (build 17.0.15+6-Ubuntu-0ubuntu124.04)
OpenJDK 64-Bit Server VM (build 17.0.15+6-Ubuntu-0ubuntu124.04, mixed mode, sharing)
```

If you don't have Java, install it. You can install only JRE (a package that contains `jre` in its name):

```
sudo apt install openjdk-17-jre
```

Download OpenRefine from [the projects' website](https://openrefine.org/download). If you download the Linux `tar.gz` version, unarchive it and run:

```
tar zxvf openrefine-linux-3.9.3.tar.gz
cd openrefine-linux-3.9.3
./refine
```

The application will run in your browser.

### Running OpenRefine




### Example data
