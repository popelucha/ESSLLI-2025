# Structured and Unstructured Data - From stories to graphs

---

## Retrieval Championship

> ... Morgan was face to face with the accumulated art and knowledge of all mankind.
>
> In his student days, he had won several retrieval championships, racing against the clock while digging out obscure items of information on lists prepared by ingeniously sadistic judges. (**"What was the rainfall in the capital of the world's smallest national state on the day when the second largest number of home runs was scored in college baseball?"** was one that he recalled with particular affection.) His skill had improved with years, and this was a perfectly straightforward question. The display came up in thirty seconds, in far more detail than he really needed.
>
> -- <cite>Arthur C. Clarke: THE FOUNTAINS OF PARADISE, 1979</cite>

---

## How would you solve the problem...

... with todays' tools?
* full text engine (old school)
* modern search engine (linked to knowledge sources)
* faceted search (similar to domain specific search engines)
* multi-hop search
* large language model (LLM)

---

## Structured and unstructured data

two views on data:

- structured: database view (tables, relations, graphs, ...)
- unstructured: documents as streams of characters

“Unstructured” means unstructured from computational point of view.
Unstructured data have no predefined data model.

However, unstructured data are structured from the human POV.

---

## A closer look to structured data

A record

```
{
  "firstName": "John",
  "lastName": "Smith",
  "age": 25
}
```

---

## A closer look to structured data

A table of records

| firstName | lastName | age |
| --------- | -------- | --- |
| Jane      | Doe      | 26  |
| John      | Smith    | 25  |


What information do we put in columns?

---

## What makes structured data valuable?

| firstName | lastName | age | city   |
| --------- | -------- | --- | ------ |
| Jane      | Doe      | 26  | Bochum |
| John      | Smith    | 25  | Bochum |


What information do we put in columns?
* the whole column is typically of the same type (entities)
* the information in the column can connect the records (relations)

---

## Graphs: entities + relations (nodes + edges)

| firstName | lastName | age | city   | #friends |
| --------- | -------- | --- | ------ | -------- |
| Jane      | Doe      | 26  | Bochum |      132 |
| John      | Smith    | 25  | Bochum |       25 |


natural language (English): Jane Doe lives in Bochum. So does John Smith. Jane has a lot of friends, while John has only 25 of them.

graph: 

Important: 
- Bochum == Bochum
- 25 != 25

--- 

### Knowledge Graph properties

Knowledge graph (KG) is a model.
The designer has to make design choices.

- decide what is the scope of the model (e.g., domain of the Bochum community)
  - what entities will be in the graph?
  - what relations will be in the graph?
- decide what entities are the same (i.e., point to the same object in reality)

---

### Graph Model and Schema = RDF

- Resource description framework (RDF)
- Resource description framework schema (RDFS)

- Describe how to model knowledge
- Provides *basic concepts* (in a **vocabulary**)
  - resource = node that can be connected to another node
  - literal = it makes no sense to connect it to other nodes
  - statement = a triple

---

### The triple

  - resource - predicate - resource
  - resource - predicate - literal

Resources have unique identifier.
For human readability, they have labels.
Labels can be in different languages.
Literals can have types.

---

### Example


---

### Now what?

- structured data can be converted to natural language.

[https://chatgpt.com/share/68793881-805c-8006-8d29-4ccbd0f3ea2f]

- structured data can easily be reused in other situations.
  - Who is in Bochum?
  - What is the average age of people in Bochum?
  - How many friends do people have at maximum?
  - Is it true that older people have more friends?

- structured data can be obtained from natural language texts using large language models
  - Let's try and [visualize](https://www.ldf.fi/service/rdf-grapher)
