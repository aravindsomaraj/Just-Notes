get = read <$> getLine
some_stmt = putStr "Give an Integer" >> (get >>= \ inp -> print(inp+1))

stmt = do   putStr "Enter n: "
            inp <- get
            print(inp*inp)
            stmt