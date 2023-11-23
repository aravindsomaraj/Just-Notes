---
title: Relational Calculus
---
# Relational Calculus [↩](../Contents/DBMS.md)
- Codd's Theorem
    ```markdown
    > Any query in a language is expressible using relational calculus.
    > The language is relationally complete.
    ```
- Two variants:
    - Tuple relational calculus
    - Domain relational calculus  
---
  
## Tuple Relational Calculus
- T is a variable - tuples of a relation as values : {(T|P(T)}
- {(T | T ∈ *instructor* ∧ T.salaray ≥ 90000)}  --> **Selection**
- {(T | ∃R ∈ *instructor*(T.name = R.name ∧ R.salary ≥ 90000)}  --> **Projection**

## Domain Relational Calculus
- Domain variable - range of domain values : {(A1,A2,...,An) | P(A1,A2,...,An)}
- {(I,N,D,S)|(I,N,D,S) ∈ *instructor* ∧ S ≥ 90000)}