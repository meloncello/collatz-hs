module Main where
import Collatz
import Graphics.EasyPlot

main :: IO ()
main = do
       _ <- mapM_ plotCollatzSequenceFrom [130..200]
       plotCollatzGraphOfSteps 1000000

plotCollatzSequenceFrom :: Integer -> IO ()
plotCollatzSequenceFrom n = do
                                let title = "img/collatzSequenceFrom" ++ show n ++ ".png"
                                _ <- plot (PNG title) graph
                                print $ "plot saved on:" ++ title
  where
  graph = Data2D [ Color Blue
                 , Style Impulses]
                 [Range 1 250]
                 $ collatzGen n

plotCollatzGraphOfSteps :: Integer -> IO ()
plotCollatzGraphOfSteps n = do
                                     _ <- plot (PNG "img/plot.png") graph
                                     print "plot saved on: img/plot.png"
    where
    graph = Data2D [ Color Blue
                   , Style Impulses ]
                   []
                   $ collatzSeqOfSteps n

