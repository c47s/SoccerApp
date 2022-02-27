{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.CreatePlayer where

import Import
import Yesod.Form.Bootstrap3 (BootstrapFormLayout (..), renderBootstrap3)

createPlayerForm :: Form Player
createPlayerForm = renderBootstrap3 BootstrapBasicForm $ Player
    <$> areq textField "First Name" Nothing
    <*> areq textField "Last Name" Nothing
    <*> areq dayField "Birthday" Nothing
    <*> areq gradeField "Grade" Nothing
    <*> areq (selectField optionsEnum) "Team Gender" Nothing
    <*> areq intField "Tryout Number" Nothing
    <*> lift (utctDay <$> liftIO getCurrentTime)
    where
        gradeField = check validateGrade intField

        validateGrade g
            | 9 <= g && g <= 12 =
                Left ("Grade must be between 9 and 12, inclusive." :: Text)
            | otherwise = Right g

