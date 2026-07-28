import BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean.IntegralEquationSolver

namespace HautevilleHouse
namespace BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean

structure SpectralProperties (K : BetheSalpeterKernel) where
  operatorType : Type u
  discreteSpectrum : Prop
  essentialSpectrum : Prop
  boundStatesFinite : Prop

structure SpectralEvidence (K : BetheSalpeterKernel) (Sp : SpectralProperties K) where
  discreteSpectrumClosed : Sp.discreteSpectrum
  essentialSpectrumClosed : Sp.essentialSpectrum
  boundStatesFiniteClosed : Sp.boundStatesFinite

def SpectralClosed (K : BetheSalpeterKernel) (Sp : SpectralProperties K) : Prop :=
  Sp.discreteSpectrum ∧ Sp.essentialSpectrum ∧ Sp.boundStatesFinite

theorem spectral_closed_from_evidence (K : BetheSalpeterKernel)
    (Sp : SpectralProperties K) (E : SpectralEvidence K Sp) :
    SpectralClosed K Sp := by
  exact And.intro E.discreteSpectrumClosed (And.intro E.essentialSpectrumClosed E.boundStatesFiniteClosed)

end BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean
end HautevilleHouse