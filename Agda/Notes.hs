{-
  @author: Wojciech Jedynak (wjedynak@gmail.com)
-}
module Notes where

----------------------------------
--  Some notes on agda sources  --
----------------------------------

-- the main entry to emacs agda-mode
import Agda.Interaction.GhciTop

import Data.IORef

-- TCM monad
import Agda.TypeChecking.Monad
---------------
--  GhciTop  --
---------------

-- the current state is passed in a global reference:
curState :: IO State
curState = readIORef theState

-- theState :: IORef State


-- what is the 'state'?

{-
data State = State
  { theTCState           :: TCState
  , theInteractionPoints :: [InteractionId]
  , theCurrentFile       :: Maybe (AbsolutePath, ClockTime)

data Independence
  = Independent (Maybe [FilePath])
  | Dependent

-- | An interactive computation.

data Interaction = Interaction
  { independence :: Independence
  , command :: TCM (Maybe ModuleName)

- | Runs a 'TCM' computation. All calls from the Emacs mode should be
-- wrapped in this function.

ioTCM :: FilePath
      -> Maybe FilePath
         -- ^ Syntax highlighting information will be written to this
         -- file, if any.
      -> Interaction
      -> IO ()
-}

-- getCurrentFile :: IO FilePath

{- evaluation

  from cmd_compute_toplevel

  ignoreAbstractMode . c
  inConcreteMode . c)
  where c = B.evalInCurrent
B.typeInCurrent
B.atTopLevel
e <- liftIO $ parse exprParser s
showA =<< cmd =<< concreteToAbstract_

import qualified Agda.Interaction.BasicOps as B
-}


{- TCM (type-checking monad)

located in Agda.TypeChecking.Monad.Base

newtype TCMT m a
  = TCM {unTCM :: TCState -> TCEnv -> m (a, TCState)}

type TCM = TCMT IO

runTCM :: TCMT IO a -> IO (Either TCErr a)

-}

{- 
moduleName example:
TopLevelModuleName {moduleNameParts = ["Wjzz","Test"]}

moduleName :: Tcm ... ModuleName

newtype ModuleName = MName {mnameToList :: [Name]}


iModuleName -> Wjzz.Test 
iModuleName :: Interface -> ModuleName
-}

{-
  data TCState =
    TCSt { stFreshThings       :: FreshThings
	 , stMetaStore	       :: MetaStore
	 , stInteractionPoints :: InteractionPoints
	 , stConstraints       :: Constraints
	 , stTakenConstraints  :: Constraints
	 , stSignature	       :: Signature
	 , stImports	       :: Signature
	 , stImportedModules   :: Set ModuleName
         , stModuleToSource    :: ModuleToSource
	 , stVisitedModules    :: VisitedModules
	 , stDecodedModules    :: DecodedModules
         , stCurrentModule     :: Maybe ModuleName
           -- ^ The current module is available after it has been type
           -- checked.
	 , stScope	       :: ScopeInfo
	 , stPersistentOptions :: CommandLineOptions
           -- ^ Options which apply to all files, unless overridden.
	 , stPragmaOptions     :: PragmaOptions
           -- ^ Options applying to the current file. @OPTIONS@
           -- pragmas only affect this field.
	 , stStatistics	       :: Statistics
	 , stMutualBlocks      :: Map MutualId (Set QName)
	 , stLocalBuiltins     :: BuiltinThings PrimFun
         , stImportedBuiltins  :: BuiltinThings PrimFun
         , stHaskellImports    :: Set String
           -- ^ Imports that should be generated by the compiler (this
           -- includes imports from imported modules).
	 }
-}

{-
data ModuleInfo = ModuleInfo
  { miInterface  :: Interface
  , miWarnings   :: Bool
  , miTimeStamp  :: ClockTime
  }

data Interface = Interface
	{ iImportedModules :: [ModuleName]
        , iModuleName      :: ModuleName
	, iScope	   :: Map ModuleName Scope
        , iInsideScope     :: ScopeInfo
	, iSignature	   :: Signature
	, iBuiltin	   :: BuiltinThings String
        , iHaskellImports  :: Set String
        , iHighlighting    :: HighlightingInfo
        , iPragmaOptions   :: [OptionsPragma]
	}
    deriving (Typeable, Data, Show)
-}