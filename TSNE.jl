begin
    hyperion_bands = [426.82, 436.99, 447.17, 457.34, 467.52, 477.69, 487.87, 498.04, 508.22, 518.39, 528.57, 538.74, 548.92, 559.09, 569.27, 579.45, 589.62, 599.8, 609.97, 620.15, 630.32, 640.5, 650.67, 660.85, 671.02, 681.2, 691.37, 701.55, 711.72, 721.9, 732.07, 742.25, 752.43, 762.6, 772.78, 782.95, 793.13, 803.3, 813.48, 823.65, 833.83, 844.0, 854.18, 864.35, 874.53, 884.7, 894.88, 905.05, 915.23, 922.54, 932.64, 942.73, 952.82, 962.91, 972.99, 983.08, 993.17, 1003.3, 1013.3, 1023.4, 1033.49, 1043.59, 1053.69, 1063.79, 1073.89, 1083.99, 1094.09, 1104.19, 1114.19, 1124.28, 1134.38, 1144.48, 1154.58, 1164.68, 1174.77, 1184.87, 1194.97, 1205.07, 1215.17, 1225.17, 1235.27, 1245.36, 1255.46, 1265.56, 1275.66, 1285.76, 1295.86, 1305.96, 1316.05, 1326.05, 1336.15, 1346.25, 1356.35, 1366.45, 1376.55, 1386.65, 1396.74, 1406.84, 1416.94, 1426.94, 1437.04, 1447.14, 1457.23, 1467.33, 1477.43, 1487.53, 1497.63, 1507.73, 1517.83, 1527.92, 1537.92, 1548.02, 1558.12, 1568.22, 1578.32, 1588.42, 1598.51, 1608.61, 1618.71, 1628.81, 1638.81, 1648.9, 1659.0, 1669.1, 1679.2, 1689.3, 1699.4, 1709.5, 1719.6, 1729.7, 1739.7, 1749.79, 1759.89, 1769.99, 1780.09, 1790.19, 1800.29, 1810.38, 1820.48, 1830.58, 1840.58, 1850.68, 1860.78, 1870.87, 1880.98, 1891.07, 1901.17, 1911.27, 1921.37, 1931.47, 1941.57, 1951.57, 1961.66, 1971.76, 1981.86, 1991.96, 2002.06, 2012.15, 2022.25, 2032.35, 2042.45, 2052.45, 2062.55, 2072.65, 2082.75, 2092.84, 2102.94, 2113.04, 2123.14, 2133.24, 2143.34, 2153.34, 2163.43, 2173.53, 2183.63, 2193.73, 2203.83, 2213.93, 2224.03, 2234.12, 2244.22, 2254.22, 2264.32, 2274.42, 2284.52, 2294.61, 2304.71, 2314.81, 2324.91, 2335.01, 2345.11, 2355.21, 2365.2, 2375.3, 2385.4, 2395.5]
    SelectedBands = (hyperion_bands[setdiff(1:end, (88:108),(131:158))])
end

begin
    X = load("/home/rnarwar/Pixxel/project/testdata/FlatARD.jld2", "OutData")
    data = X[rand(1:end,3000),:]
    data = data .- mean(data, dims = 2)
end

begin
    using MultivariateStats
    using Statistics
    using TSne
    using LinearAlgebra
end

begin
    using Plots
    gr()
    theme(:orange)
end

begin
    using ArchGDAL
    const AG = ArchGDAL
    using FileIO
    using NPZ
    using DelimitedFiles
    using JLD2
end

x = tsne(data, 3, 0, 1000, 30)
p = scatter(x[:,1],x[:,2],x[:,3], ms = 1, size=(1600,900))
