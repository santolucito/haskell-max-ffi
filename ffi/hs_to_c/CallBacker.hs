module Main(main) where

-- a type for the C double
import Foreign.C.Types(CDouble(..))
-- function pointer type and free function
import Foreign.Ptr(FunPtr, freeHaskellFunPtr)

-- a "wrapper import gives a factory for converting a Haskell function
-- to a foriegn function pointer
-- What the hell does that mean...

foreign import ccall "wrapper"
  wrap :: (CDouble -> CDouble) -> IO (FunPtr (CDouble -> CDouble))

-- import foreign function as noremal... whatever normal is....

foreign import ccall "callerback.h identity"
  identity :: FunPtr (CDouble -> CDouble) -> CDouble -> IO CDouble

-- the function to be used as a callback

square :: CDouble -> CDouble
square x = x + 1

-- and the main

main :: IO()
main = do
  squareW <- wrap square -- make function pointer from function
  let x = 4
  y <- identity squareW x 
  print y
  freeHaskellFunPtr squareW


