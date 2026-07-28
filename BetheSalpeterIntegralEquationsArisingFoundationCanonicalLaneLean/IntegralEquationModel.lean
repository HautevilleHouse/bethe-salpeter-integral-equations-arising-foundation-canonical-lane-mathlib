import HautevilleHouse.BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean.BetheSalpeterCore

namespace HautevilleHouse
namespace BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean

structure IntegralEquationPackage (G : GreenFunctionModel) (K : KernelModel) where
  betheSalpeterEquation : Prop
  ladderApproximation : Prop
  couplingConsistency : Prop
  uvFinite : Prop

def IntegralEquationClosed {G : GreenFunctionModel} {K : KernelModel} (I : IntegralEquationPackage G K) : Prop :=
  I.betheSalpeterEquation ∧ I.ladderApproximation ∧ I.couplingConsistency ∧ I.uvFinite

structure IntegralEquationEvidence {G : GreenFunctionModel} {K : KernelModel} (I : IntegralEquationPackage G K) where
  betheSalpeterEquationClosed : I.betheSalpeterEquation
  ladderApproximationClosed : I.ladderApproximation
  couplingConsistencyClosed : I.couplingConsistency
  uvFiniteClosed : I.uvFinite

theorem integral_equation_closed_from_evidence {G : GreenFunctionModel} {K : KernelModel}
    (I : IntegralEquationPackage G K) (E : IntegralEquationEvidence I) : IntegralEquationClosed I := by
  exact And.intro E.betheSalpeterEquationClosed
    (And.intro E.ladderApproximationClosed
      (And.intro E.couplingConsistencyClosed E.uvFiniteClosed))

end BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean
end HautevilleHouse
