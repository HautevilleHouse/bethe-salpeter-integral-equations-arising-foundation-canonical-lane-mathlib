import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean

structure GreenFunctionModel where
  spacetime : Type u
  FeynmanPropagator : Prop
  twoPointFunction : Type v
  spectralRepresentation : Prop
  conclusion : spectralRepresentation

def BetheSalpeterWitnessClosed (G : GreenFunctionModel) : Prop :=
  G.spectralRepresentation

structure KernelModel where
  kernelType : Type w
  boundedness : Prop
  symmetry : Prop
  integralOperator : Type x
  kernelRegularity : Prop

structure KernelEvidence (K : KernelModel) where
  boundednessClosed : K.boundedness
  symmetryClosed : K.symmetry
  kernelRegularityClosed : K.kernelRegularity

def KernelClosed (K : KernelModel) : Prop :=
  K.boundedness ∧ K.symmetry ∧ K.kernelRegularity

theorem kernel_closed_from_evidence (K : KernelModel) (E : KernelEvidence K) : KernelClosed K := by
  exact And.intro E.boundednessClosed (And.intro E.symmetryClosed E.kernelRegularityClosed)

end BetheSalpeterIntegralEquationsArisingFoundationCanonicalLaneLean
end HautevilleHouse
