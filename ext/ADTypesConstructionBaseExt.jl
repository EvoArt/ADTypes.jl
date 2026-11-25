module ADTypesConstructionBaseExt

using ADTypes: AutoEnzyme, AutoForwardDiff, AutoPiste, AutoPolyesterForwardDiff
using ConstructionBase: ConstructionBase

struct InternalAutoEnzymeReconstructor{A} end

InternalAutoEnzymeReconstructor{A}(mode::M) where {M, A} = AutoEnzyme{M, A}(mode)

function ConstructionBase.constructorof(::Type{<:AutoEnzyme{M, A}}) where {M, A}
    return InternalAutoEnzymeReconstructor{A}
end

function ConstructionBase.constructorof(::Type{<:AutoForwardDiff{chunksize}}) where {chunksize}
    return AutoForwardDiff{chunksize}
end

struct InternalAutoPisteReconstructor{C} end

InternalAutoPisteReconstructor{C}(mode) where {C} = AutoPiste(; mode, chunksize = C)

function ConstructionBase.constructorof(::Type{<:AutoPiste{M, C}}) where {M, C}
    return InternalAutoPisteReconstructor{C}
end

function ConstructionBase.constructorof(::Type{<:AutoPolyesterForwardDiff{chunksize}}) where {chunksize}
    return AutoPolyesterForwardDiff{chunksize}
end

end
