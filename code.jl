module sjlp三阶罗盘
using LinearAlgebra
export Ls, solve

#示例以及常量预设
const Example_B = [0, 2, 4]
const Example_M = [-2, 1, 4]
struct PreSetLs
    L_100
    L_010
    L_001
    L_110
    L_101
    L_011
end
Ls = PreSetLs(
    [1,0,0],
    [0,1,0],
    [0,0,1],
    [1,1,0],
    [1,0,1],
    [0,1,1],
)
const Example_L = [Ls.L_110;; Ls.L_101;; Ls.L_011]

"""
B是初始状态，9点钟为极轴方向，顺时针为正
M是每圈旋转参数
L是可供操作的方法矩阵
"""
function solve(;B::Vector{Int}=Example_B, M::Vector{Int}=Example_M, L::Matrix=Example_L, r=0:10)
    leng = length(B) == length(M) == size(L)[1] ? nothing : throw(ArgumentError("Check Input"))

    nM = M.\1
    C = B.*nM

    xs = Dict([[i, j, k] => NaN for i in r, j in r, k in r])
    for x in xs
        all(isinteger.((L*x[1] + C)./6nM)) ? xs[x[1]] = sum(x[1]) : pop!(xs, x[1])
    end

    keys = [x[1] for x in xs]
    vals = [x[2] for x in xs]
    indexs = findall(x == minimum(vals) for x in vals)
    return ([keys[i] for i in indexs]...,)
end

end

using Main.sjlp三阶罗盘
solve(;B=[0, 2, 4], M=[-2, 1, 4], L=[Ls.L_110; Ls.L_101; Ls.L_011])