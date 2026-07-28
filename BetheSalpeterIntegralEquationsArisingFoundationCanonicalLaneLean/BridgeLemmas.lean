import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.endpointCondition

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion.left

end BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean
end HautevilleHouse