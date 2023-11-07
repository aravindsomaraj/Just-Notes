---
title: Normal Forms
---
## Ist Normal Form [↩](../../Contents/DBMS.md)
- Rules:
  - Each attribute contains atomic values:
    - If composite values, make separate coloumns.
    - If multivalued, make separate tuples (or create new table to store multivalued variable values).
  - Each col contains values from same domain.
  - Each col has unique name.
  - No ordering applied to cols nor rows.
  <li> No duplicate rows.

---
## 2nd Normal Form
- Rules:
  - It is in 1NF.
  - No partial dependancy.
    - Partial dependancy is when :
        `Proper subset of C`<sub>`k`</sub>` -> non-prime attribute`
  <li> Decompose R to remove partial dependancy to make it in 2NF. 
---

## 3rd Normal Form
- Rules: 
  - It is in 2NF.
  - No transitive dependancy for non-prime attributes.
  - There should be no functional dependancy like :
    `Non-prime attribute -> Non-prime attribute`
  - > **NOTE**: AB -> C where A is prime attr, and B is non-prime attr, then **AB is considered non-prime attr** in above condition.

| 2NF           |   |      3NF      |
|  -            | - |       -       |
| No PD -> NDA  |   | No PD -> NDA  |
|               |   | No NDA -> NDA |

- Alternate way to check 3NF:
  - Satisfies either of the following conditions for each of the non-trivial FDs:
    - **LHS is Super key**
    - **RHS is Prime attribute**
  
## BCNF
- R is in BCNF iff:
  - It is in 3NF
  - For each non-trivial FD X->Y, **X must be a super key**.
    

