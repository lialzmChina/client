module Types exposing (..)

import Json.Decode as Json



type Msg
    = NoOp
    -- === Card Activation ===
    | Activate String
    | ActivatePast
    | ActivateFuture
    | GoLeft String
    | GoDown String
    | GoUp String
    | GoRight String
    -- === Card Editing  ===
    | OpenCard String String
    | UpdateField String
    | UpdateCard String String
    | DeleteCard String
    | CancelCard
    -- === Card Insertion  ===
    | Insert (Maybe String) (Maybe String) (Maybe String)
    | InsertAbove String
    | InsertBelow String
    | InsertChild String
    -- === Card Moving  ===
    -- === External Inputs ===
    | OpIn Json.Value
    | ExternalCommand (String, String)
    | HandleKey String



-- OBJECTS

type Op
  = Ins String String (Maybe String) Int (Maybe String)
  | Del String




-- TRANSIENTS

type alias ViewState =
  { active : String
  , activePast : List String
  , activeFuture : List String
  , descendants : List String
  , editing : Maybe String
  , field : String
  }


type alias Tree =
  { id : String
  , content : String
  , parentId : Maybe String
  , position : Int
  , children : Children
  }


type Children = Children (List Tree)
type alias Group = List Tree
type alias Column = List (List Tree)
