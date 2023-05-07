# StarRailNavigationCompassSolve
Auto Solve Star Rail's Navigation Compass

自动求解星穹铁道的引航罗盘问题.

数学不好优化失败了，最后用的暴力求解，虽然也很快但如果有更优雅的方法岂不美哉.

当个小玩具就好.

由于GitHub对LaTeX公式支持不是很好，所以附带了一份适用Typora的MD原件.

## 示例图

示例初始图如下：

![初始罗盘图片](https://github.com/Xlin0mu/StarRailNavigationCompassSolve/blob/main/示例.png)

## Example

```julia
julia> using Main.sjlp三阶罗盘
julia> solve(;B=[0, 2, 4], M=[-2, 1, 4], L=[Ls.L110;; Ls.L101;; Ls.L011])
([4, 2, 0], [1, 2, 3])
```

## 使用例2

![使用例2](https://github.com/Xlin0mu/StarRailNavigationCompassSolve/blob/main/使用例2.png)

```julia
julia> solve(;B=[2, 4, 4], M=[2, 4, 2], L=[Ls.L100;; Ls.L010;; Ls.L001])
([2, 2, 1],)
```

## 补充说明

![T1](https://github.com/Xlin0mu/StarRailNavigationCompassSolve/blob/main/T1.png)

![T2](https://github.com/Xlin0mu/StarRailNavigationCompassSolve/blob/main/T2.png)

