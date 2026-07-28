import BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean.IntegralEquation

/-!
# Bound State Spectrum Package
-/

namespace HautevilleHouse
namespace BetheSalpeter

structure BoundStateSpectrumPackage {K : BetheSalpeterKernelPackage} {kern : BetheSalpeterKernelClosed K}
    {I : IntegralEquationPackage kern} (iClosed : IntegralEquationClosed I) where
  spectrumDefined : Prop
  discreteSpectrum : Prop
  continuousSpectrum : Prop
  boundStateMasses : Prop

structure BoundStateSpectrumEvidence {K : BetheSalpeterKernelPackage} {kern : BetheSalpeterKernelClosed K}
    {I : IntegralEquationPackage kern} {iClosed : IntegralEquationClosed I}
    (S : BoundStateSpectrumPackage iClosed) where
  spectrumDefinedClosed : S.spectrumDefined
  discreteSpectrumClosed : S.discreteSpectrum
  continuousSpectrumClosed : S.continuousSpectrum
  boundStateMassesClosed : S.boundStateMasses

def BoundStateSpectrumClosed {K : BetheSalpeterKernelPackage} {kern : BetheSalpeterKernelClosed K}
    {I : IntegralEquationPackage kern} {iClosed : IntegralEquationClosed I}
    (S : BoundStateSpectrumPackage iClosed) : Prop :=
  S.spectrumDefined ∧ S.discreteSpectrum ∧ S.continuousSpectrum ∧ S.boundStateMasses

theorem bound_state_spectrum_closed_from_evidence
    {K : BetheSalpeterKernelPackage} {kern : BetheSalpeterKernelClosed K}
    {I : IntegralEquationPackage kern} {iClosed : IntegralEquationClosed I}
    (S : BoundStateSpectrumPackage iClosed) (E : BoundStateSpectrumEvidence S) :
    BoundStateSpectrumClosed S :=
  And.intro E.spectrumDefinedClosed
    (And.intro E.discreteSpectrumClosed
      (And.intro E.continuousSpectrumClosed E.boundStateMassesClosed))

end BetheSalpeter
end HautevilleHouse
