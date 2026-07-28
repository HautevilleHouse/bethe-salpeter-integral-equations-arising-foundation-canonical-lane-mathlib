import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean

structure SpectralRepresentationPackage where
  spectralFunction : Type u
  dispersionRelation : Prop
  analyticContinuation : Prop
  asymptoticBound : Prop

structure SpectralRepresentationEvidence (S : SpectralRepresentationPackage) where
  dispersionRelationClosed : S.dispersionRelation
  analyticContinuationClosed : S.analyticContinuation
  asymptoticBoundClosed : S.asymptoticBound

def SpectralRepresentationClosed (S : SpectralRepresentationPackage) : Prop :=
  S.dispersionRelation ∧ S.analyticContinuation ∧ S.asymptoticBound

theorem spectral_representation_closed_from_evidence (S : SpectralRepresentationPackage) (E : SpectralRepresentationEvidence S) :
    SpectralRepresentationClosed S := by
  exact And.intro E.dispersionRelationClosed (And.intro E.analyticContinuationClosed E.asymptoticBoundClosed)

end BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean
end HautevilleHouse
