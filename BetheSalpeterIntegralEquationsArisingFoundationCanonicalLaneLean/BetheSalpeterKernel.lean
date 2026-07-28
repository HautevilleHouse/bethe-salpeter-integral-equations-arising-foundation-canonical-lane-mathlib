import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean

structure BetheSalpeterKernelPackage where
  kernelFunction : Type u
  boundStateEquation : Prop
  spectralRepresentation : Prop
  regularityProperties : Prop

structure BetheSalpeterKernelEvidence (K : BetheSalpeterKernelPackage) where
  boundStateEquationClosed : K.boundStateEquation
  spectralRepresentationClosed : K.spectralRepresentation
  regularityPropertiesClosed : K.regularityProperties

def BetheSalpeterKernelClosed (K : BetheSalpeterKernelPackage) : Prop :=
  K.boundStateEquation ∧ K.spectralRepresentation ∧ K.regularityProperties

theorem bethe_salpeter_kernel_closed_from_evidence (K : BetheSalpeterKernelPackage) (E : BetheSalpeterKernelEvidence K) :
    BetheSalpeterKernelClosed K := by
  exact And.intro E.boundStateEquationClosed (And.intro E.spectralRepresentationClosed E.regularityPropertiesClosed)

end BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean
end HautevilleHouse
