{-
interactions of modules with type Classes

(1) Modulo is about locality
(2) type classes wants to globalise, Type class coherence

foo x y = x <= y

foo :: Ord a => a -> a -> Bool

we can imagine foo like this
foo {instance} x y = x <=[instance] y

    module A                    module B
-ord instance_int           - ord instance_int
foo tr = insert 42 tr       bar tr = search 42 tr
        \                           /
          \                       /    
            \                   /
              \               /
                   module C
                A.foo, B.bar

[Note] : We cannot selectively block instances of a class using modules.

Not orphan if the instance is in the module where is class is defined or the type is defined. 
    
This will prevent from having  multiple instance of a type class.

Orphan instances comes with coherence problem. Coherence problem comes up at runtime.
-}