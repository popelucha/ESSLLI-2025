
# Connecting the two worlds

---

## Strengths and Weaknesses

LLMs are very good and language generation. $\rightarrow$ They are understandable.

Logics can check consistency and describe facts precisely. $\rightarrow$ They are correct.

Understandable and correct?

---

## Ask LLMs to Reason

* LLMs have internal knowledge (encoded in their weights)
  * this knowledge is gained through consumption of huge amounts of texts
  * the knowledge is limited by the model cutoff date
* reasoning models perform a series of *thinking* steps
* sometimes, models are able to express [their uncertainty](../references.md#Kadavath2022)
* specifically fine-tuned LLMs for logical reasoning exist (e.g., DeepMind [Selection Inference](../references.md#Creswell2022))

[Awesome LLM Reasoning Collection](../references.md#Awesome)

---

## Example of LLM reasoning

*Question:* Verna loves to eat fruit. She bought three apples at $1.50
each, five oranges at $0.80 each, and six peaches at $0.75 each. If
she gave $20, how much change did she receive?

*Answer:*
```
three apples cost 3 x $1.50 = $<<3*1.5=4.50>>4.50.
five oranges cost 5 x $0.80 = $<<5*0.8=4>>4.
four peaches cost 6 x $0.75 = $<<6*0.75=4.50>>4.50.
thus, verna paid a total of $4.50 +$4+ $4.50 = $<<4.5+4+4.5=13>>13.
therefore, verna received $20 - $13 = $<<20-13=7>>7.
```

Example from [Kadavath et al., 2022](../references.md#Kadavath2022)

---

## Limitations

It's very challenging for current LLMs to perform complex reasoning:

* multi-hop reasoning
* to know their reasoning limits
* overlooking of logical fallacies (e.g., [Li et al., 2024](../references.md#Li2024))

---

## A Promising Approach: Circuit Tracing

![](circuits.png)

Image from [Lindsey et al., 2025](../references.md#Lindsey2025)

---

## From Natural Language to Description Logic

* create/update the knowledge base
  * does the representation reflect common understanding?
  * how to represent implicit knowledge (i.e., not present in the input data)?
  * what existing ontologies/vocabularies can be used?
* query the knowledge base

---

## Natural Language $\rightarrow$ Formalization

The holy grail of the Natural Language Processing (NLP).

Historically:

* formal grammars
* named entity recognition and linking
* information extraction
* ...

Even with the LLMs, it's not easy.
[ChatGPT conversation](https://chatgpt.com/share/6883a1c8-b994-8006-8768-7e88914e25d4)

---

## Problems within LLMs

* force the model to follow the modeling **design choices**
* prevent the model to **fabricate** the facts

---

## Could Retrieval Augmented Generation (RAG) be the Solution?

* provide the up-to-date knowledge to the model
* prevent hallucinations

---

## RAG

* Retrieval = knowledge is encoded so that the model understands it
  * chunks of knowledge are encoded into **embedding vectors** and stored in a database
  * at query time, RAG compares the question embedding vector with the database and answers with the most similar chunk

The difficult part(s):

* how to make the chunks
* is the encoding part correct?
* is the vector comparison the best way?

* Generation = the easier part for LLMs

---

## RAG: Retrieval Example

* chunking is based on chunk length, text structure, etc.

```
| firstName | lastName | age | city   |
|-----------|----------|----:|--------|
| Jane      | Doe      | 26  | Bochum |
| John      | Smith    | 25  | Bochum |
```

Example of suboptimal chunking:

```
|           | Doe      | 26  | Bochum |
| John      |          |     |        |

```

*How old is John?*

---

## Combine Knowledge Graphs with RAG

* encode *correct* chunks of knowledge - the KG statements

Sometimes, this is called Graph RAG.

---

## Data Querying with LLMs

LLMs can produce SPARQL queries:

* no need of SPARQL
* different wordings for the same question
* let's try this in the hands-on session

---

## Summary

* LLMs have reasoning capabilities.
* Knowledge graphs have advanced reasoning, but they are difficult to build and maintain.
* Hybrid approaches can benefit from LLMs' good ability to generate:
  * LLMs can convert text to triples (to some extent)
  * LLMs can query KGs (generate the SPARQL queries)
  * LLMs can express the facts in the KG in natural language
* KG can support the retrieval in RAG.
* Logic inside KG can check consistence and correctness of the answers.

# Conclusion

---

Back to the initial question (from the *Fountains of paradise*):

**"What was the rainfall in the capital of the world's smallest national state on the day when the second largest number of home runs was scored in college baseball?"**

Currently, this question cannot be answered by a simple web search nor a large language model.

However,

* there are ways how to formalize knowledge about rainfall, geography, and sports
* there are standards how to link such knowledge
* there are ways how to query a knowledge base
* ... even with the natural language

---

## During the Course

Let's check whether you:

* learned what knowledge graphs are
* realize what is the difference between tabular and graph data and how the latter can be obtained from the former
* recognize some parts of the large idea of the Semantic Web during your web searches
* know what *good* data mean
* understand that description logic is a subset of first order predicate logic
* understand how can knowledge be stored in RDF/OWL triples
* know what type of new knowledge can be inferred in knowledge graphs
* are able to query huge knowledge bases such as DBPedia or Wikidata
* see advantages and disadvantages of LLMs in reasoning
* know about the good things in both worlds
