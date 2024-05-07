-- (1) State monad s -> (a,s)

-- Monad transformation  StateT     s           m            a
--                                 /\           /\           /\
--                                 |             \           |
--                              state type  inner monad    value

-- for all monads m StateT s m is a monad
-- type CalcM = StateT Env IO

newtype StateT s m a = StateT {runStateT :: s -> m (a,s)}


newtype Identity a = Identity {runIdentity :: a}

-- (1) Functor Instance
-- (2) Applicative Instance
-- (3) Monad Instance

instance Functor m => Functor (StateT s m)  where
    -- fmap :: (a -> b) -> StateT s m a -> StateT s m b
    fmap f sma = StateT fn
        -- fn :: s -> m(b,s) 
        where fn s0 = fmap foo (runStateT sma s0)
                        where 
                            foo (a,s) = (f a,s)

instance Monad m => Applicative (StateT s m) where
    -- pure :: a -> State s m a
    pure a = StateT fn 
        where 
            fn s0 = pure (a,s0)

    -- (<*>) StateT s m (a->b) -> StateT s m a -> StateT s m b
    (<*>) sf sa = StateT fn 
        where
            fn s0 = do (f,s1) <- runStateT sf s0
                       (x,s2) <- runStateT sa s1
                       return (f x, s2)

instance Monad m => Monad (StateT s m) where

    -- (>>=) :: StateT s m a -> (a -> StateT s m b) -> StateT s m b

    (>>=) sma fsmb = StateT fn 
                    where  
                        fn s0 = do (a,s1) <- runStateT sma s0
                                   runStateT fsmb s1


-- write get and put for StateT
-- check with hlint
{-

lift :: m a -> StateT s m a
lift ma = StateT fm
    fn s0 = do x <- ma
               return (x,s0)

-}

{-
newType Foo = Bar {foo :: Int}

-- Equivalent to 
newtype Foo = Bar Int
foo (Bar x) = x
-}
