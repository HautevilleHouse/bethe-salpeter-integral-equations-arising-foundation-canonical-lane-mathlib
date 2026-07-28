import HautevilleHouse.BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean.SpectralProperties

namespace HautevilleHouse
namespace BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean

structure RenormalizationPackage {G : GreenFunctionModel} {K : KernelModel}
    {I : IntegralEquationPackage G K} {S : SpectralPropertiesPackage I} where
  renormalizationCondition : Prop
  counterTermSubtraction : Prop
  couplingStrengthDefined : Prop
  scaleIndependence : Prop

def RenormalizationClosed {G : GreenFunctionModel} {K : KernelModel}
    {I : IntegralEquationPackage G K} {S : SpectralPropertiesPackage I}
    (R : RenormalizationPackage S) : Prop :=
  R.renormalizationCondition ∧ R.counterTermSubtraction ∧
  R.couplingStrengthDefined ∧ R.scaleIndependence

structure RenormalizationEvidence {G : GreenFunctionModel} {K : KernelModel}
    {I : IntegralEquationPackage G K} {S : SpectralPropertiesPackage I}
    (R : RenormalizationPackage S) where
  renormalizationConditionClosed : R.renormalizationCondition
  counterTermSubtractionClosed : R.counterTermSubtraction
  couplingStrengthDefinedClosed : R.couplingStrengthDefined
  scaleIndependenceClosed : R.scaleIndependence

theorem renormalization_closed_from_evidence {G : GreenFunctionModel} {K : KernelModel}
    {I : IntegralEquationPackage G K} {S : SpectralPropertiesPackage I}
    (R : RenormalizationPackage S) (E : RenormalizationEvidence R) : RenormalizationClosed R := by
  exact And.intro E.renormalizationConditionClosed
    (And.intro E.counterTermSubtractionClosed
      (And.intro E.couplingStrengthDefinedClosed E.scaleIndependenceClosed))

end BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean
end HautevilleHouse
