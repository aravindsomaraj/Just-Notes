---
title: Introduction
---
# Why Databases? [↩](../Contents/DBMS.md)

- Easy to deploy and access
- Adaptive to new applications and technological changes

# Advantages of DBMS over File Systems

- **Data consistency and integrity:** to ensure that the data stored in the database is accurate and reliable.  
- **Reduced data redundancy:** DBMS stores data in a normalized form that reduces data redundancy and improves data integrity. In contrast, file systems may store data redundantly in multiple files, leading to inconsistencies and errors.
- **Efficient data retrieval:** DBMS provides efficient ways to retrieve and manipulate data, such as indexing, query optimization, and caching,
- **Security:** DBMS provides security features such as user authentication, access control, and encryption to protect data from unauthorized access, modification, and theft.
- **Data Abstraction:** File systems abstract the physical storage of data by hiding the details of the physical storage and providing a simple interface to access files. DBMS offers a higher level of abstraction by providing a conceptual view of the data that is independent of its physical representation. A DBMS abstracts the physical storage of data and provides a logical view of data as tables with rows and columns. Users can query the data using a structured query language (SQL), which allows them to retrieve and manipulate data in a flexible and powerful way (data manipulation).
- **Concurrent access and data sharing:** DBMS allows multiple users to access and modify the same data concurrently, without the risk of data inconsistency or conflicts. In contrast, file systems typically do not support concurrent access and data sharing.
- **Recovery:** DBMS uses a transaction log to record all the changes made to the database during a transaction. In case of a system failure or error, the DBMS can use the transaction log to recover the database to the state it was in before the failure or error occurred. Does this by a technique called ACID *(Atomicity, consistency, isolation, durability)*.