download.file("https://github.com/nutrimetabolomics/metaboData/blob/main/Datasets/2018-MetabotypingPaper/DataValues_S013.csv", "DataValues_S013.csv")
download.file("https://github.com/nutrimetabolomics/metaboData/blob/main/Datasets/2018-MetabotypingPaper/DataInfo_S013.csv", "DataInfo_S013.csv")
library(SummarizedExperiment)
library(tidyverse)
library(FactoMineR)
library(factoextra)
# Cargar los archivos de datos
data_values <- read.csv("C:/Users/User/Downloads/dataset_metabotyping/DataValues_S013.csv", row.names = 1)
data_info <- read.csv("C:/Users/User/Downloads/dataset_metabotyping/DataInfo_S013.csv")

# Crear colData y rowData para el objeto SummarizedExperiment
colData <- DataFrame(data_info, row.names = colnames(data_values))
rowData <- DataFrame(row.names = rownames(data_values))

# Crear el objeto SummarizedExperiment
se <- SummarizedExperiment(assays = list(counts = data_values), rowData = rowData, colData = colData)
# Exploración inicial del dataset
cat("Dimensiones del dataset:\n")
print(dim(se))
# Seleccionar solo columnas numéricas (metabolitos) para el PCA
metabolite_data <- assay(se) %>%
  select_if(is.numeric)

# Aplicar PCA a los datos metabolómicos
pca_result <- PCA(metabolite_data, scale.unit = TRUE, graph = FALSE)

# Visualizar los resultados del PCA
fviz_pca_ind(pca_result,
             geom.ind = "point",
             pointshape = 21,
             fill = "lightblue",
             col.ind = "cos2", # Color según calidad de representación
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE,
             title = "Analisis de Componentes Principales (PCA) de Datos Metabolomicos")
# Calcular la matriz de distancias y aplicar clustering jerárquico
dist_matrix <- dist(scale(metabolite_data))
hc <- hclust(dist_matrix, method = "ward.D2")

# Visualizar el dendrograma
fviz_dend(hc, k = 4, # Seleccionar un número de clusters
          cex = 0.5,
          k_colors = c("#00AFBB", "#E7B800", "#FC4E07", "#8E44AD"),
          color_labels_by_k = TRUE,
          rect = TRUE,
          rect_fill = TRUE,
          rect_border = "jco",
          main = "Dendrograma de Clustering Jerarquico")
# Convertir metabolite_data a formato largo para hacer un análisis descriptivo por grupo
metabolite_long <- metabolite_data %>%
  pivot_longer(cols = everything(), names_to = "Metabolite", values_to = "Level")

# Calcular estadísticas descriptivas
group_data <- metabolite_long %>%
  group_by(Metabolite) %>%
  summarize(mean = mean(Level, na.rm = TRUE), sd = sd(Level, na.rm = TRUE),
            min = min(Level, na.rm = TRUE), max = max(Level, na.rm = TRUE))

head(group_data)
