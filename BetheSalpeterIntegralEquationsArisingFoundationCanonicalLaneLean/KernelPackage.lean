import HautevilleHouse.BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean.AdmissibleClass

/-!
# Kernel Package

The interaction kernel in the Bethe-Salpeter equation.
-/

namespace HautevilleHouse
namespace BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean

structure KernelData where
  momenta : Type u
  spinIndices : Type v
  kernelFunction : momenta → momenta → spinIndices → spinIndices → ℂ
  symmetryCondition : Prop
  analyticContinuationCondition : Prop

structure KernelPackage where
  kernel : KernelData
  isIrreducible : Prop
  isConnected : Prop
  satisfiesLorenzCovariance : Prop
  satisfiesWardIdentity : Prop

structure KernelEvidence (K : KernelPackage) where
  isIrreducibleClosed : K.isIrreducible
  isConnectedClosed : K.isConnected
  satisfiesLorenzCovarianceClosed : K.satisfiesLorenzCovariance
  satisfiesWardIdentityClosed : K.satisfiesWardIdentity

def KernelClosed (K : KernelPackage) : Prop :=
  K.isIrreducible ∧ K.isConnected ∧ K.satisfiesLorenzCovariance ∧ K.satisfiesWardIdentity

theorem kernel_closed_from_evidence (K : KernelPackage) (E : KernelEvidence K) :
    KernelClosed K := by
  exact And.intro E.isIrreducibleClosed (And.intro E.isConnectedClosed (And.intro E.satisfiesLorenzCovarianceClosed E.satisfiesWardIdentityClosed))

end BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean
end HautevilleHouse