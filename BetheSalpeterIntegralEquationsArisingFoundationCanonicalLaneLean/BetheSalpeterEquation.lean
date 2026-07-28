import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean

structure BetheSalpeterEquationPackage where
  integralKernel : Type u
  couplingConstant : Prop
  boundStateSolution : Prop
  normalizationCondition : Prop

structure BetheSalpeterEquationEvidence (E : BetheSalpeterEquationPackage) where
  couplingConstantClosed : E.couplingConstant
  boundStateSolutionClosed : E.boundStateSolution
  normalizationConditionClosed : E.normalizationCondition

def BetheSalpeterEquationClosed (E : BetheSalpeterEquationPackage) : Prop :=
  E.couplingConstant ∧ E.boundStateSolution ∧ E.normalizationCondition

theorem bethe_salpeter_equation_closed_from_evidence (E : BetheSalpeterEquationPackage) (Ev : BetheSalpeterEquationEvidence E) :
    BetheSalpeterEquationClosed E := by
  exact And.intro Ev.couplingConstantClosed (And.intro Ev.boundStateSolutionClosed Ev.normalizationConditionClosed)

end BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean
end HautevilleHouse
