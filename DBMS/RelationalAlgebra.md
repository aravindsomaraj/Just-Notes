---
title: Relational Algebra
---
# Relational Algebra [↩](../Contents/DBMS.md)
- Basis for SQL
- Operates on relations
- Outputs a relation
---

- ### Selection (σ)
    - Selects tuples that satisfy a given predicate
    - Allows =, ≠, <, ≤, >, and ≥ comparisons
    - Allow comparisons between attributes

- ### Projection (π)
    - Extracts a specified coloumn of a relation
    - Eliminates duplicates

- ### Cartesian Product || Cross Join (R x S , concat of a ∈ R and b ∈ S)
    - Rename operation is possible.

- ### Join Operation ( R ⨝ S = σ (R x S) )
    - Cartesian product but filtered results using some condition (condition written after ⨝ as subscript).
    - ### Special Cases:
        - Equijoin: Where all equality condition is applied.
        - Natural join: Equality condition on all common attributes.
    
    - Outer Join (⟗) : Allows null values in the new relation
        - Keep tuples from a relation that does find match for the join condition
        - Associate null values for the attributes in other relation
    
    - Left Outer Join (⟕) : Keeps all tuples from left relation.
    - Right Outer Join (⟖): Keeps all tuples from right relation.
- ### Set Operations
    - Union (U): Does Union operation. For R U S, have to have same number of attributes and domain of attributes must appear in the same order.
    - Intersection (⋂) : Does Intersection. Intersection compatibility is same as Union Compatibility.
    - Set difference (-) : Does R-S operation. Union compatibility.
    - Division (/) : Consider two relations R(x,y) and S(y), R/S : set of x, for every y in S , there is a (x,y) in R

- ### Generalized Projection
    - Allows arithmetic operation in project operation.

- ### Aggregate Functions
    - COUNT,SUM,MAX,MIN,AVG
    - G1,G2,...Gn ∱F1(A1),...Fn(An)(R)

- ### Null Value
    - Unknown or not exist
    - Aggregation ignores NULL values