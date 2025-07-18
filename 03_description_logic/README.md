# Logic and Inference

---

# First-order predicate logic (FOPL)

---

## FOPL Components

* constants
* variables
* predicates
* quantifiers
* operators/logical connectives
* expressions/terms
* formulas
  * atomic formulas
  * constructed formulas using quantifiers and connectives

---

## FOPL and Natural Language

* FOPL: formula is a (mathematical) fact
* Language: Statement

Both can have a truth value:

* Tim-Berners Lee invented the World Wide Web.
* greater_than(x, 5)

---

## FOPL and Inference

We can infer new facts:

* All humans are mortal.
* Socrates is a human.
* Therefore, Socrates is mortal.

---

## Try to Convert in FOPL

- Hello.
- What is the weather today?
- We arrived to Bochum, Germany.
- Billy kicked the ball into the goal and started jumping for joy.
- Some students attended the course.
- Nobody likes rainy weather.

<details>
<summary>Tips</summary>
 What should the predicate be?<br>
 What should the variables/constants be?<br>
 What is the relation between conjunctions and logical operators AND, OR?<br>
 What are the quantifiers in natural language?
</details>

---

## Problems with FOPL Conversion

* not all sentences can be converted into FOPL formulae
* natural language sentence can have different interpretations

Almost every hour, an American dies of melanoma.

$\exists a \forall h: die(a, h)$

$\forall h \exists a: die(a, h)$

### Other Ambiguity Types

* Sisters reunited after ten years in checkout line at Safeway.
* The chicken is ready to eat.
* The princess wants to marry the strongest knight in the kingdom.

---

## FOPL and the AND operator

> Billy kicked the ball into the goal and started jumping for joy.

The “and” means that both events happened *in a sequence*.

> Billy started jumping for joy and kicked the ball into the goal.

---

## Individuals and Roles

> The princess wants to marry the strongest knight in the kingdom.

### Individual/Role Ambiguity and Inference

* Kamala Harris wanted to become the President of the US.
* Donald Trump became the President of the US.
* $\rightarrow$ Kamala Harris wanted to become Donald Trump.

### FOPL Predicates

WantsToBecome(k, PresidentOfUS)

WantsToBecome(k, d)

PresidentOfUS - is a role (dependent on time)

---

# Description Logic

---

## Description Logic $\subset$ FOPL

* reduces the expressivity of FOPL
* is decidable
* good balance between expressiveness and computational complexity

[Wikipedia](../references.md#WikipediaDescriptionLogic)
