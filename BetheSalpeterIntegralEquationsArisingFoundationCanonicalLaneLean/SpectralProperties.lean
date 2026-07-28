import HautevilleHouse.BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean.IntegralEquationModel

namespace HautevilleHouse
namespace BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean

structure SpectralPropertiesPackage {G : GreenFunctionModel} {K : KernelModel}
    (I : IntegralEquationPackage G K) where
  boundStateCondition : Prop
  continuousSpectrum : Prop
  eigenvalueInequality : Prop
  positivityConstraint : Prop

def SpectralPropertiesClosed {G : GreenFunctionModel} {K : KernelModel}
    {I : IntegralEquationPackage G K} (S : SpectralPropertiesPackage I) : Prop :=
  S.boundStateCondition ∧ S.continuousSpectrum ∧ S.eigenvalueInequality ∧ S.positivityConstraint

structure SpectralPropertiesEvidence {G : GreenFunctionModel} {K : KernelModel}
    {I : IntegralEquationPackage G K} (S : SpectralPropertiesPackage I) where
  boundStateConditionClosed : S.boundStateCondition
  continuousSpectrumClosed : S.continuousSpectrum
  eigenvalueInequalityClosed : S.eigenvalueInequality
  positivityConstraintClosed : S.positivityConstraint

theorem spectral_properties_closed_from_evidence {G : GreenFunctionModel} {K : KernelModel}
    {I : IntegralEquationPackage G K} (S : SpectralPropertiesPackage I)
    (E : SpectralPropertiesEvidence S) : SpectralPropertiesClosed S := by
  exact And.intro E.boundStateConditionClosed
    (And.intro E.continuousSpectrumClosed
      (And.intro E.eigenvalueInequalityClosed E.positivityConstraintClosed))

end BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean
end HautevilleHouse
