---
title: Relational Models
---
# Relational Model [↩](../Contents/DBMS.md)
- Represents data as tables, made of rows and coloumns
- Each table is a relation, each row is a tuple, each coloumn is an attribute of the tuple.
- **Primary Keys** are unique identifiers for tuples in a relation.
- **Foreign Keys** establish relationship between tables.  
- Benefits:
    - **Data independance** between storage and retrievals.
    - **Data consistency** regarding use of keys and relations.
    - **Flexibility** regarding modification of data and relationships.
    - **Ease of Use** regarding organizing and querying.

## <ins>Integrity Constraints: 
- Domain Constraints:
    - Atomic Values and null values
    - Unique tuples
- Key constraints:
    - Distinguish tuples, Unique
    - Super key - Set of 1 or more attributes that identiy tuples uniquely
    - Candidate key - Minimal super key (set -> 1 element)
    - Primary key - Candidate key chosen based on infrequent updates
    - Foreign key - Check consistency of data
    - General constraints - Avoid errors during modification

## <ins>ER Model to Relational Model
- For converting an Entity set to a table:
    - Composite attributes -> New attributes in the table
    - Multivalued attributes -> Create a new table for the corresponding new relation
- When dealing with WEAK ENTITY set, convert Weak entity set to a table whose **primary key is a combination of the primary key of the new table, and the primary key of the parent table**. Make parent table. Add foreign key constraint in weak entity set table referencing primary key of parent table.
- For Relationships with **Descriptive Attributes**, create an INTERSECTION table with **foreign keys referencing primary keys of the two entities and coloumns for the descriptive attributes**.
- Remove redundant relations
- ER Model with Aggregation requires relation for aggregated relationship set. This is because multiple relations are required for the multiple associations between the superclass and the subclasses of data. 
- That cannot be ommited.