import Control.Proxy
import Control.Proxy.TCP
 
main :: IO ()
main = serve (Host "0.0.0.0") "8000" $ \(socket,_) ->
       runProxy $ socketReadS 4096 socket >-> socketWriteD socket