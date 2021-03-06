{-# LANGUAGE CPP #-}
{-# LANGUAGE Rank2Types #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}
-------------------------------------------------------------------------------
-- |
-- Module      :  Control.Lens.Tuple
-- Copyright   :  (C) 2012 Edward Kmett
-- License     :  BSD-style (see the file LICENSE)
-- Maintainer  :  Edward Kmett <ekmett@gmail.com>
-- Stability   :  provisional
-- Portability :  Rank2Types
--
-------------------------------------------------------------------------------
module Control.Lens.Tuple
  (
  -- * Tuples
    Field1(..)
  , Field2(..)
  , Field3(..)
  , Field4(..)
  , Field5(..)
  , Field6(..)
  , Field7(..)
  , Field8(..)
  , Field9(..)
  ) where

import Control.Lens.Combinators
import Control.Lens.Type

-- $setup
-- >>> import Control.Lens

-- | Provides access to 1st field of a tuple.
class Field1 s t a b | s -> a, t -> b, s b -> t, t a -> s where
  -- | Access the 1st field of a tuple (and possibly change its type).
  --
  -- >>> (1,2)^._1
  -- 1
  --
  -- >>> _1 .~ "hello" $ (1,2)
  -- ("hello",2)
  --
  -- >>> (1,2) & _1 .~ "hello"
  -- ("hello",2)
  --
  -- >>> _1 putStrLn ("hello","world")
  -- hello
  -- ((),"world")
  --
  -- This can also be used on larger tuples as well
  --
  -- >>> _1 +~ 41 $ (1,2,3,4,5)
  -- (42,2,3,4,5)
  --
  -- @
  -- _1 :: 'Lens' (a,b) (a',b) a a'
  -- _1 :: 'Lens' (a,b,c) (a',b,c) a a'
  -- _1 :: 'Lens' (a,b,c,d) (a',b,c,d) a a'
  -- ...
  -- _1 :: 'Lens' (a,c,d,e,f,g,h,i) (a',b,c,d,e,f,g,h,i) a a'
  -- @
  _1 :: Lens s t a b

-- | @'_1' k ~(a,b) = (\a' -> (a',b)) '<$>' k a@
instance Field1 (a,b) (a',b) a a' where
  _1 k ~(a,b) = k a <&> \a' -> (a',b)
  {-# INLINE _1 #-}

instance Field1 (a,b,c) (a',b,c) a a' where
  _1 k ~(a,b,c) = k a <&> \a' -> (a',b,c)
  {-# INLINE _1 #-}

instance Field1 (a,b,c,d) (a',b,c,d) a a' where
  _1 k ~(a,b,c,d) = k a <&> \a' -> (a',b,c,d)
  {-# INLINE _1 #-}

instance Field1 (a,b,c,d,e) (a',b,c,d,e) a a' where
  _1 k ~(a,b,c,d,e) = k a <&> \a' -> (a',b,c,d,e)
  {-# INLINE _1 #-}

instance Field1 (a,b,c,d,e,f) (a',b,c,d,e,f) a a' where
  _1 k ~(a,b,c,d,e,f) = k a <&> \a' -> (a',b,c,d,e,f)
  {-# INLINE _1 #-}

instance Field1 (a,b,c,d,e,f,g) (a',b,c,d,e,f,g) a a' where
  _1 k ~(a,b,c,d,e,f,g) = k a <&> \a' -> (a',b,c,d,e,f,g)
  {-# INLINE _1 #-}

instance Field1 (a,b,c,d,e,f,g,h) (a',b,c,d,e,f,g,h) a a' where
  _1 k ~(a,b,c,d,e,f,g,h) = k a <&> \a' -> (a',b,c,d,e,f,g,h)
  {-# INLINE _1 #-}

instance Field1 (a,b,c,d,e,f,g,h,i) (a',b,c,d,e,f,g,h,i) a a' where
  _1 k ~(a,b,c,d,e,f,g,h,i) = k a <&> \a' -> (a',b,c,d,e,f,g,h,i)
  {-# INLINE _1 #-}

-- | Provides access to the 2nd field of a tuple
class Field2 s t a b | s -> a, t -> b, s b -> t, t a -> s where
  -- | Access the 2nd field of a tuple
  --
  -- >>> _2 .~ "hello" $ (1,(),3,4)
  -- (1,"hello",3,4)
  --
  -- >>> (1,2,3,4) & _2 *~ 3
  -- (1,6,3,4)
  --
  -- >>> _2 print (1,2)
  -- 2
  -- (1,())
  --
  -- @
  -- 'Control.Lens.Fold.anyOf' '_2' :: (s -> 'Bool') -> (a, s) -> 'Bool'
  -- 'Data.Traversable.traverse' '.' '_2' :: ('Applicative' f, 'Data.Traversable.Traversable' t) => (a -> f b) -> t (s, a) -> f (t (s, b))
  -- 'Control.Lens.Fold.foldMapOf' ('Data.Traversable.traverse' '.' '_2') :: ('Data.Traversable.Traversable' t, 'Data.Monoid.Monoid' m) => (s -> m) -> t (b, s) -> m
  -- @
  _2 :: Lens s t a b

-- | @'_2' k ~(a,b) = (\b' -> (a,b')) '<$>' k b@
instance Field2 (a,b) (a,b') b b' where
  _2 k ~(a,b) = k b <&> \b' -> (a,b')
  {-# INLINE _2 #-}

instance Field2 (a,b,c) (a,b',c) b b' where
  _2 k ~(a,b,c) = k b <&> \b' -> (a,b',c)
  {-# INLINE _2 #-}

instance Field2 (a,b,c,d) (a,b',c,d) b b' where
  _2 k ~(a,b,c,d) = k b <&> \b' -> (a,b',c,d)
  {-# INLINE _2 #-}

instance Field2 (a,b,c,d,e) (a,b',c,d,e) b b' where
  _2 k ~(a,b,c,d,e) = k b <&> \b' -> (a,b',c,d,e)
  {-# INLINE _2 #-}

instance Field2 (a,b,c,d,e,f) (a,b',c,d,e,f) b b' where
  _2 k ~(a,b,c,d,e,f) = k b <&> \b' -> (a,b',c,d,e,f)
  {-# INLINE _2 #-}

instance Field2 (a,b,c,d,e,f,g) (a,b',c,d,e,f,g) b b' where
  _2 k ~(a,b,c,d,e,f,g) = k b <&> \b' -> (a,b',c,d,e,f,g)
  {-# INLINE _2 #-}

instance Field2 (a,b,c,d,e,f,g,h) (a,b',c,d,e,f,g,h) b b' where
  _2 k ~(a,b,c,d,e,f,g,h) = k b <&> \b' -> (a,b',c,d,e,f,g,h)
  {-# INLINE _2 #-}

instance Field2 (a,b,c,d,e,f,g,h,i) (a,b',c,d,e,f,g,h,i) b b' where
  _2 k ~(a,b,c,d,e,f,g,h,i) = k b <&> \b' -> (a,b',c,d,e,f,g,h,i)
  {-# INLINE _2 #-}

-- | Provides access to the 3rd field of a tuple
class Field3 s t a b | s -> a, t -> b, s b -> t, t a -> s where
  -- | Access the 3rd field of a tuple
  _3 :: Lens s t a b

instance Field3 (a,b,c) (a,b,c') c c' where
  _3 k ~(a,b,c) = k c <&> \c' -> (a,b,c')
  {-# INLINE _3 #-}

instance Field3 (a,b,c,d) (a,b,c',d) c c' where
  _3 k ~(a,b,c,d) = k c <&> \c' -> (a,b,c',d)
  {-# INLINE _3 #-}

instance Field3 (a,b,c,d,e) (a,b,c',d,e) c c' where
  _3 k ~(a,b,c,d,e) = k c <&> \c' -> (a,b,c',d,e)
  {-# INLINE _3 #-}

instance Field3 (a,b,c,d,e,f) (a,b,c',d,e,f) c c' where
  _3 k ~(a,b,c,d,e,f) = k c <&> \c' -> (a,b,c',d,e,f)
  {-# INLINE _3 #-}

instance Field3 (a,b,c,d,e,f,g) (a,b,c',d,e,f,g) c c' where
  _3 k ~(a,b,c,d,e,f,g) = k c <&> \c' -> (a,b,c',d,e,f,g)
  {-# INLINE _3 #-}

instance Field3 (a,b,c,d,e,f,g,h) (a,b,c',d,e,f,g,h) c c' where
  _3 k ~(a,b,c,d,e,f,g,h) = k c <&> \c' -> (a,b,c',d,e,f,g,h)
  {-# INLINE _3 #-}

instance Field3 (a,b,c,d,e,f,g,h,i) (a,b,c',d,e,f,g,h,i) c c' where
  _3 k ~(a,b,c,d,e,f,g,h,i) = k c <&> \c' -> (a,b,c',d,e,f,g,h,i)
  {-# INLINE _3 #-}

-- | Provide access to the 4th field of a tuple
class Field4 s t a b | s -> a, t -> b, s b -> t, t a -> s where
  -- | Access the 4th field of a tuple
  _4 :: Lens s t a b

instance Field4 (a,b,c,d) (a,b,c,d') d d' where
  _4 k ~(a,b,c,d) = k d <&> \d' -> (a,b,c,d')
  {-# INLINE _4 #-}

instance Field4 (a,b,c,d,e) (a,b,c,d',e) d d' where
  _4 k ~(a,b,c,d,e) = k d <&> \d' -> (a,b,c,d',e)
  {-# INLINE _4 #-}

instance Field4 (a,b,c,d,e,f) (a,b,c,d',e,f) d d' where
  _4 k ~(a,b,c,d,e,f) = k d <&> \d' -> (a,b,c,d',e,f)
  {-# INLINE _4 #-}

instance Field4 (a,b,c,d,e,f,g) (a,b,c,d',e,f,g) d d' where
  _4 k ~(a,b,c,d,e,f,g) = k d <&> \d' -> (a,b,c,d',e,f,g)
  {-# INLINE _4 #-}

instance Field4 (a,b,c,d,e,f,g,h) (a,b,c,d',e,f,g,h) d d' where
  _4 k ~(a,b,c,d,e,f,g,h) = k d <&> \d' -> (a,b,c,d',e,f,g,h)
  {-# INLINE _4 #-}

instance Field4 (a,b,c,d,e,f,g,h,i) (a,b,c,d',e,f,g,h,i) d d' where
  _4 k ~(a,b,c,d,e,f,g,h,i) = k d <&> \d' -> (a,b,c,d',e,f,g,h,i)
  {-# INLINE _4 #-}

-- | Provides access to the 5th field of a tuple
class Field5 s t a b | s -> a, t -> b, s b -> t, t a -> s where
  -- | Access the 5th field of a tuple
  _5 :: Lens s t a b

instance Field5 (a,b,c,d,e) (a,b,c,d,e') e e' where
  _5 k ~(a,b,c,d,e) = k e <&> \e' -> (a,b,c,d,e')
  {-# INLINE _5 #-}

instance Field5 (a,b,c,d,e,f) (a,b,c,d,e',f) e e' where
  _5 k ~(a,b,c,d,e,f) = k e <&> \e' -> (a,b,c,d,e',f)
  {-# INLINE _5 #-}

instance Field5 (a,b,c,d,e,f,g) (a,b,c,d,e',f,g) e e' where
  _5 k ~(a,b,c,d,e,f,g) = k e <&> \e' -> (a,b,c,d,e',f,g)
  {-# INLINE _5 #-}

instance Field5 (a,b,c,d,e,f,g,h) (a,b,c,d,e',f,g,h) e e' where
  _5 k ~(a,b,c,d,e,f,g,h) = k e <&> \e' -> (a,b,c,d,e',f,g,h)
  {-# INLINE _5 #-}

instance Field5 (a,b,c,d,e,f,g,h,i) (a,b,c,d,e',f,g,h,i) e e' where
  _5 k ~(a,b,c,d,e,f,g,h,i) = k e <&> \e' -> (a,b,c,d,e',f,g,h,i)
  {-# INLINE _5 #-}

-- | Provides access to the 6th element of a tuple
class Field6 s t a b | s -> a, t -> b, s b -> t, t a -> s where
  -- | Access the 6th field of a tuple
  _6 :: Lens s t a b

instance Field6 (a,b,c,d,e,f) (a,b,c,d,e,f') f f' where
  _6 k ~(a,b,c,d,e,f) = k f <&> \f' -> (a,b,c,d,e,f')
  {-# INLINE _6 #-}

instance Field6 (a,b,c,d,e,f,g) (a,b,c,d,e,f',g) f f' where
  _6 k ~(a,b,c,d,e,f,g) = k f <&> \f' -> (a,b,c,d,e,f',g)
  {-# INLINE _6 #-}

instance Field6 (a,b,c,d,e,f,g,h) (a,b,c,d,e,f',g,h) f f' where
  _6 k ~(a,b,c,d,e,f,g,h) = k f <&> \f' -> (a,b,c,d,e,f',g,h)
  {-# INLINE _6 #-}

instance Field6 (a,b,c,d,e,f,g,h,i) (a,b,c,d,e,f',g,h,i) f f' where
  _6 k ~(a,b,c,d,e,f,g,h,i) = k f <&> \f' -> (a,b,c,d,e,f',g,h,i)
  {-# INLINE _6 #-}

-- | Provide access to the 7th field of a tuple
class Field7 s t a b | s -> a, t -> b, s b -> t, t a -> s where
  -- | Access the 7th field of a tuple
  _7 :: Lens s t a b

instance Field7 (a,b,c,d,e,f,g) (a,b,c,d,e,f,g') g g' where
  _7 k ~(a,b,c,d,e,f,g) = k g <&> \g' -> (a,b,c,d,e,f,g')
  {-# INLINE _7 #-}

instance Field7 (a,b,c,d,e,f,g,h) (a,b,c,d,e,f,g',h) g g' where
  _7 k ~(a,b,c,d,e,f,g,h) = k g <&> \g' -> (a,b,c,d,e,f,g',h)
  {-# INLINE _7 #-}

instance Field7 (a,b,c,d,e,f,g,h,i) (a,b,c,d,e,f,g',h,i) g g' where
  _7 k ~(a,b,c,d,e,f,g,h,i) = k g <&> \g' -> (a,b,c,d,e,f,g',h,i)
  {-# INLINE _7 #-}

-- | Provide access to the 8th field of a tuple
class Field8 s t a b | s -> a, t -> b, s b -> t, t a -> s where
  -- | Access the 8th field of a tuple
  _8 :: Lens s t a b

instance Field8 (a,b,c,d,e,f,g,h) (a,b,c,d,e,f,g,h') h h' where
  _8 k ~(a,b,c,d,e,f,g,h) = k h <&> \h' -> (a,b,c,d,e,f,g,h')
  {-# INLINE _8 #-}

instance Field8 (a,b,c,d,e,f,g,h,i) (a,b,c,d,e,f,g,h',i) h h' where
  _8 k ~(a,b,c,d,e,f,g,h,i) = k h <&> \h' -> (a,b,c,d,e,f,g,h',i)
  {-# INLINE _8 #-}

-- | Provides access to the 9th field of a tuple
class Field9 s t a b | s -> a, t -> b, s b -> t, t a -> s where
  -- | Access the 9th field of a tuple
  _9 :: Lens s t a b

instance Field9 (a,b,c,d,e,f,g,h,i) (a,b,c,d,e,f,g,h,i') i i' where
  _9 k ~(a,b,c,d,e,f,g,h,i) = k i <&> \i' -> (a,b,c,d,e,f,g,h,i')
  {-# INLINE _9 #-}
