module Counter where

import Prelude

import Effect (Effect)
import React.Basic.DOM as R
import React.Basic.Events (handler_)
import React.Basic.Hooks (CreateComponent, component, toKey, useEffect, useState, (/\))
import React.Basic.Hooks as React

mkCounter :: CreateComponent {}
mkCounter = do
  component "Counter" \props ->
    -- if props.on
    --   then React.pure $ R.text "hi."
    --   else
      React.do
        counter /\ setCounter <- useState 0

        useEffect [toKey counter] do
          setDocumentTitle $ "Count: " <> show counter
          pure mempty

        React.pure $ R.button
          { onClick: handler_ $ setCounter (_ + 1)
          , children: [ R.text $ "Increment: " <> show counter ]
          }

foreign import setDocumentTitle :: String -> Effect Unit