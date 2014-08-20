{-# LANGUAGE OverloadedStrings #-}
import       Data.ByteString.Lazy (ByteString)
import       Data.ByteString.Lazy.Char8 (unpack)
import       Data.Monoid (mappend)
import       Data.Text (Text, reverse)
import       Hakyll
import       Prelude hiding (reverse)
import       System.Posix.Resource


-- | Process SASS
sass = getResourceLBS
  >>= withItemBody (unixFilterLBS "sass" ["--stdin", "--style", "compressed"])
  >>= return . fmap unpack

main :: IO ()
main = hakyll $ do
  match "images/*" $ do
    route idRoute
    compile copyFileCompiler

  match "stylesheets/*" $ do
    route $ setExtension "css"
    compile sass

  match "pages/*" $ do
    route $
      gsubRoute "pages/" (const "") `composeRoutes`
      setExtension "html"
    compile $ pandocCompiler
      >>= loadAndApplyTemplate "templates/default.html" defaultContext
      >>= relativizeUrls

  match "templates/*" $ compile templateCompiler
