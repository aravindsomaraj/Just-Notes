maybe :: r -> (a -> r) -> Maybe a -> r

data Either a b = Left a | Right b

getVar v env = maybe (Left err) Right . (M.lookup v)
    where err = v <> " undefined"