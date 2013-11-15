import Control.Concurrent
import Control.Concurrent.STM
import Control.Concurrent.STM.TChan

main = do
  ch <- atomically newTChan  
  forkIO $ reader ch >>= putStrLn
  writer ch

  

reader = atomically . readTChan
writer ch = atomically $ writeTChan ch "hi!"  