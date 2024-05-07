{-
(1) Functor
(2) Applicative
(3) Monad

[] :: Type -> Type   | one parameter types
IO :: Type -> Type   |
Maybe 
Either err
State

Functor 
    fmap :: Functor t => (a -> b) -> t a -> t b

Applicative 
    <*> :: Applicative t => t (a -> b) -> t a -> t b
    pure :: Applicative t => a -> t a

Monad 
    (>>=) :: Monad t => t a -> (a -> t b) -> t b
    return :: Monad t => a -> t a
    (>>) :: Monad t => t a -> t b -> t b

    do  x <- foo              = foo >>= \x -> bar (... x ...)
        bar (... x ...)




(1) Design your main datatype and functions.
pure functional programming
eval :: Env -> Expr -> Maybe Double

(2) State monad is needed for mutable environment  
type CalcM = StateT Env IO

Parsing Language
-- Embeded domain specific language

html templating

-- C is far away from hardware
-- hasekll is not that far away from hardware..

digram library.
meta fonts.

-}