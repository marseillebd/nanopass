{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE DeriveTraversable #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE StandaloneDeriving #-}

module Lang where

import Data.Monoid (First)
import Language.Nanopass (deflang)

data Foo a b c = Foo [c]
  deriving (Show,Functor,Foldable,Traversable)

[deflang|
((L0 ann funny)
  (Expr
    (Var String)
    (Lam ann String (* Stmt))
    (App Expr Expr)
    (Nope String)
    (UhOh (&
      (* (First Expr))
      (* Expr)
      (Foo (Int) (Int) Expr)
    ))
  )
  (Stmt
    (Expr funny Expr)
    (Let String Expr)
  )
)
|]
deriving stock instance (Show ann, Show funny) => Show (Expr ann funny)
deriving stock instance (Show ann, Show funny) => Show (Stmt ann funny)
