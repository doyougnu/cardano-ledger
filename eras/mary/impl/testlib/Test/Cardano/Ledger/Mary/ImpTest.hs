{-# LANGUAGE UndecidableInstances #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module Test.Cardano.Ledger.Mary.ImpTest () where

import Cardano.Crypto.DSIGN.Class (DSIGNAlgorithm (..))
import Cardano.Crypto.Hash (Hash)
import Cardano.Ledger.Core (EraIndependentTxBody)
import Cardano.Ledger.Crypto (Crypto (..))
import Cardano.Ledger.Mary (MaryEra)
import Test.Cardano.Ledger.Shelley.ImpTest (
  EraImpTest (..),
  emptyShelleyImpNES,
  shelleyImpWitsVKeyNeeded,
 )

instance
  ( Crypto c
  , Signable (DSIGN c) (Hash (HASH c) EraIndependentTxBody)
  ) =>
  EraImpTest (MaryEra c)
  where
  emptyImpNES = emptyShelleyImpNES

  impWitsVKeyNeeded = shelleyImpWitsVKeyNeeded
