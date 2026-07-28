import HautevilleHouse.BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean.GreenFunctionPackage

/-!
# Self-Energy Package

Self-energy in the Bethe-Salpeter equation.
-/

namespace HautevilleHouse
namespace BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean

structure SelfEnergyPackage {K : KernelPackage} (G : GreenFunctionPackage K) where
  selfEnergyFunction : momentum → spinSpace → spinSpace → ℂ
  oneParticleIrreducible : Prop
  satisfiesDysonEquation : Prop
  analyticityDomain : Prop

structure SelfEnergyEvidence {K : KernelPackage} {G : GreenFunctionPackage K} (S : SelfEnergyPackage G) where
  oneParticleIrreducibleClosed : S.oneParticleIrreducible
  satisfiesDysonEquationClosed : S.satisfiesDysonEquation
  analyticityDomainClosed : S.analyticityDomain

def SelfEnergyClosed {K : KernelPackage} {G : GreenFunctionPackage K} (S : SelfEnergyPackage G) : Prop :=
  S.oneParticleIrreducible ∧ S.satisfiesDysonEquation ∧ S.analyticityDomain

theorem self_energy_closed_from_evidence {K : KernelPackage} {G : GreenFunctionPackage K} (S : SelfEnergyPackage G) (E : SelfEnergyEvidence S) :
    SelfEnergyClosed S := by
  exact And.intro E.oneParticleIrreducibleClosed (And.intro E.satisfiesDysonEquationClosed E.analyticityDomainClosed)

end BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean
end HautevilleHouse