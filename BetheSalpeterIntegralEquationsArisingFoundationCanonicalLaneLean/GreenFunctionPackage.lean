import HautevilleHouse.BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean.KernelPackage

/-!
# Green's Function Package

Propagators in the Bethe-Salpeter formalism.
-/

namespace HautevilleHouse
namespace BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean

structure GreenFunctionData where
  momentum : Type u
  spinSpace : Type v
  freePropagator : momentum → spinSpace → spinSpace → ℂ
  fullPropagator : momentum → spinSpace → spinSpace → ℂ
  spectralRepresentation : Prop

structure GreenFunctionPackage (K : KernelPackage) where
  free : GreenFunctionData
  full : GreenFunctionData
  dysonEquationSatisfied : Prop
  selfEnergyConsistent : Prop
  wardIdentityConsistent : Prop

structure GreenFunctionEvidence {K : KernelPackage} (G : GreenFunctionPackage K) where
  dysonEquationSatisfiedClosed : G.dysonEquationSatisfied
  selfEnergyConsistentClosed : G.selfEnergyConsistent
  wardIdentityConsistentClosed : G.wardIdentityConsistent

def GreenFunctionClosed {K : KernelPackage} (G : GreenFunctionPackage K) : Prop :=
  G.dysonEquationSatisfied ∧ G.selfEnergyConsistent ∧ G.wardIdentityConsistent

theorem green_function_closed_from_evidence {K : KernelPackage} (G : GreenFunctionPackage K) (E : GreenFunctionEvidence G) :
    GreenFunctionClosed G := by
  exact And.intro E.dysonEquationSatisfiedClosed (And.intro E.selfEnergyConsistentClosed E.wardIdentityConsistentClosed)

end BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean
end HautevilleHouse