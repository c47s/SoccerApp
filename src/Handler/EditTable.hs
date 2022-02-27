{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.EditTable where

import Import

-- Proof of concept for turning lists into a table

getEditTableR :: Handler Html
getEditTableR = do
    let headings = ["A", "B", "C", "D", "E", "F", "G"] :: [Text]
    let rows = [[a ++ b | a <- ["A", "B", "C", "D", "E", "F", "G"]] | b <- ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]] :: [[Text]]
    defaultLayout $ do
        $(widgetFile "edit-table")