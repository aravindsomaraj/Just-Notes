## Notes
1. Linear type System
2. Dependant type systems (proof assistances)
    - list, Maybe  --- Type  
      list as momorphic "function" from Type -> Type
    - lists of type A of lenth n  
    T : Bool -> Type
    T b = if b then Nat else Bool

```Haskell
hGetChar :: Handle -> IO Char
         :: Handle -> Handle * Char
x : T b

f = fun (b : Bool) => if b then 42 else false
b : B -> T b -- Dependant-type f b : T b
```

