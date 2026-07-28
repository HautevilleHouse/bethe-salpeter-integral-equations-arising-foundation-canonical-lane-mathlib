import BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean.BetheSalpeterKernel

/-!
# Bethe-Salpeter Integral Equation Package
-/

namespace HautevilleHouse
namespace BetheSalpeter

structure IntegralEquationPackage {K : BetheSalpeterKernelPackage} (kern : BetheSalpeterKernelClosed K) where
  equationFormulation : Prop
  existenceOfSolution : Prop
  uniquenessOfSolution : Prop
  analyticContinuation : Prop

structure IntegralEquationEvidence {K : BetheSalpeterKernelPackage} {kern : BetheSalpeterKernelClosed K}
    (I : IntegralEquationPackage kern) where
  equationFormulationClosed : I.equationFormulation
  existenceOfSolutionClosed : I.existenceOfSolution
  uniquenessOfSolutionClosed : I.uniquenessOfSolution
  analyticContinuationClosed : I.analyticContinuation

def IntegralEquationClosed {K : BetheSalpeterKernelPackage} {kern : BetheSalpeterKernelClosed K}
    (I : IntegralEquationPackage kern) : Prop :=
  I.equationFormulation ∧ I.existenceOfSolution ∧ I.uniquenessOfSolution ∧ I.analyticContinuation

theorem integral_equation_closed_from_evidence
    {K : BetheSalpeterKernelPackage} {kern : BetheSalpeterKernelClosed K}
    (I : IntegralEquationPackage kern) (E : IntegralEquationEvidence I) :
    IntegralEquationClosed I :=
  And.intro E.equationFormulationClosed
    (And.intro E.existenceOfSolutionClosed
      (And.intro E.uniquenessOfSolutionClosed E.analyticContinuationClosed))

end BetheSalpeter
end HautevilleHouse
