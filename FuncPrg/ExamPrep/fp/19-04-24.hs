{- 
(1) Definition of a module.
module Foo (<export list>) where        \  in a file in Foo.hs
    binding (values/ type)              /

(2) Nesting is done through File heirarchy 
    (no direct nesting of modules)
        src/Foo.hs <- module Foo
        src/Foo/Bar.hs <- module Foo.Bar

(3) At use site modules are imported
    import Foo.Bar
    import Foo.Bar (<import list>) <- Further restriction from Foo.Bar's export list 
    import Foo.Bar hiding (<hiding list>) <- everything except the ones in the <hiding list> will be imported

"Intution is not a substitute for rigour." -- Piyush

    singleton
    Data.List.singleton :: a -> [a]
    Data.Set.singleton :: a -> Set a

    import qualified Foo.Bar.Biz as FBB. --- Foo.Bar.Biz is given another name
        FBB.x means Foo.Bar.Biz.x

    import Foo.Bar.Biz as FBB.   --- Foo.Bar.Biz is imported and also we can access it using FBB
        FBB.x means Foo.Bar.Biz.x
        x means Foo.Bar.Biz.x


module Foo (x ...)       -- If we mention x in the export list we can access 
                            x in Foo (which is from Bar) is accessible as Foo.x
    import Bar           -- Bar.x is available in Foo
    x 

module Foo (module Bar) -- will be able to export everything from Bar through Foo.        
    import Bar          -- Bar.x and Bar.y is available in Foo
    x 

while doing this we are not creating Foo.Bar, but exposing contents of Bar through Foo.


-}