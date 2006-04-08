{- 
Copyright (C) 2006 John Goerzen <jgoerzen@complete.org>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-}


module WildMatchtest(tests) where
import Test.HUnit
import MissingH.Path.WildMatch
import MissingH.HUnit

test_wildMatchCase =
    let f patt name = assertBool (patt ++ "," ++ name ++ " was false")
                      (wildMatchCase patt name)
        f0 patt name = assertBool (patt ++ "," ++ name ++ " was true")
                       (not $ wildMatchCase patt name)
    [f "asdf" "asdf",
     f "?*?" "abc",
     f "???*" "asd",
     f "*???" "asd",
     f "???" "asd",
     f "*" "asd",
     f "ab[cd]" "abc",
     f "ab[!de]" "abc",
     f0 "ab[de]" "abc",
     f0 "??" "a",
     f0 "a" "b",
     f "[\\]" "\\",
     f "[!\\]" "a",
     f0 "[!\\]", "\\"]
     
tests = TestList [TestLabel "wildMatchCase" (TestList test_wildMatchCase)]




