import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean

structure BetheSalpeterAdmittedObject where
  kernelData : KernelData
  greenFunctionData : GreenFunctionData
  endpointCondition : Prop
  remainderCondition : Prop
  conclusion : endpointCondition ∧ remainderCondition

structure AdmissibleClass where
  object : BetheSalpeterAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BetheSalpeterWitnessClosed A.object.endpointCondition A.object.remainderCondition

end BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean
end HautevilleHouse