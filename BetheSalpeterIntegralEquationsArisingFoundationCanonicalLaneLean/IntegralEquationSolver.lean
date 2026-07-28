import BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean.BetheSalpeterKernel

namespace HautevilleHouse
namespace BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean

structure IntegralEquationSolver (K : BetheSalpeterKernel) where
  solutionSpace : Type u
  integralEquation : Prop
  existence : Prop
  uniqueness : Prop
  continuousDependence : Prop

structure IntegralEquationSolverEvidence (K : BetheSalpeterKernel)
    (S : IntegralEquationSolver K) where
  existenceClosed : S.existence
  uniquenessClosed : S.uniqueness
  continuousDependenceClosed : S.continuousDependence

def IntegralEquationSolverClosed (K : BetheSalpeterKernel)
    (S : IntegralEquationSolver K) : Prop :=
  S.existence ∧ S.uniqueness ∧ S.continuousDependence

theorem integral_equation_solver_closed_from_evidence (K : BetheSalpeterKernel)
    (S : IntegralEquationSolver K) (E : IntegralEquationSolverEvidence K S) :
    IntegralEquationSolverClosed K S := by
  exact And.intro E.existenceClosed (And.intro E.uniquenessClosed E.continuousDependenceClosed)

end BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean
end HautevilleHouse