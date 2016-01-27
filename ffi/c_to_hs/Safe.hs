{-# LANGUAGE ForeignFunctionInterface #-}

module Safe where

import Foreign.C.Types

add_one :: Int -> Int
add_one x = x + 1

add_one_hs :: CInt -> CInt
add_one_hs = fromIntegral . add_one . fromIntegral

foreign export ccall add_one_hs :: CInt -> CInt
