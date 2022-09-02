module CMD where

import Path ( Path, Destination, Origin )

data Command
    = MkDir Path
    | CopyDir Origin Destination
    | CopyFile Origin Destination
    | Echo String
    | Cls 
    | Minify Origin Destination
    | GitInit
    | SpagoTest
    | SpagoBuild
    | SpagoBundleApp Destination

instance Show Command where
    show (MkDir path) = "mkdir " ++ show path
    show (CopyDir origin destination) = "xcopy /s " ++ show origin ++ " " ++ show destination ++ " /i /d /y /e "
    show (CopyFile origin destination) = "copy " ++ show origin ++ " " ++ show destination
    show (Echo string) = "echo " ++ string
    show Cls = "cls"
    show (Minify origin destination) = "uglifyjs " ++ show origin ++ " -c -m -o " ++ show destination
    show GitInit = "git init"
    show SpagoTest = "spago test"
    show SpagoBuild = "spago build"
    show (SpagoBundleApp destination) = "spago bundle-app --main Main --to " ++ show destination

newtype PackageJSON = PackageJSON String

newtype Version = Version String

newtype Description = Description String deriving Eq 

instance Show Description where
    show (Description description) = description
