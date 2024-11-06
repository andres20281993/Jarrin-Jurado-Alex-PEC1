# Metadatos del Dataset

## Descripción General
Este dataset se utilizó en el estudio "Metabotypes of response to bariatric surgery independent of the magnitude of weight loss". Los datos incluyen perfiles metabolómicos y clínicos de 39 pacientes que fueron recolectados en cinco puntos de tiempo diferentes. El objetivo del estudio fue evaluar cómo los perfiles metabolómicos de los pacientes responden a la cirugía bariátrica de manera independiente a la pérdida de peso.

## Estructura del Dataset

- **Número de muestras**: 39
- **Número de variables (columnas)**: 695
- **Puntos de tiempo**: Los datos se recolectaron en cinco momentos específicos después de la intervención.

## Archivos Incluidos

1. `DataValues_S013.csv`: Contiene los valores clínicos y metabolómicos.
   - **Filas**: Cada fila representa una muestra de un paciente.
   - **Columnas**: Las primeras columnas contienen datos clínicos, y el resto son perfiles metabolómicos.

2. `DataInfo_S013.csv`: Proporciona información adicional sobre cada columna en `DataValues_S013.csv`.

3. `AAInformation_S006.htm`: Información adicional sobre algunos metabolitos específicos (solo referencias y contexto, sin datos cuantitativos).

## Variables Principales

### Información Demográfica y Clínica
- **SUBJECTS**: Identificación única del paciente.
- **SURGERY**: Tipo de cirugía recibida.
- **AGE**: Edad en el momento de la cirugía.
- **GENDER**: Género del paciente.
- **Group**: Clasificación del paciente según el tipo de tratamiento.

### Variables Clínicas (Ejemplos)
- **GLU_T0, GLU_T2, GLU_T4, GLU_T5**: Niveles de glucosa en diferentes puntos de tiempo.
- **INS_T0, INS_T2, INS_T4, INS_T5**: Niveles de insulina en diferentes puntos de tiempo.
- **PESO_T0, PESO_T2, PESO_T4, PESO_T5**: Peso del paciente en los diferentes puntos de tiempo.
- **TG_T0, TG_T2, TG_T4, TG_T5**: Niveles de triglicéridos en sangre.
- **HDL_T0, HDL_T2, HDL_T4, HDL_T5**: Colesterol HDL en sangre.

### Variables Metabolómicas (Ejemplos)
- **Val_T0, Val_T2, Val_T4, Val_T5**: Concentración del aminoácido valina en los diferentes puntos de tiempo.
- **Ala_T0, Ala_T2, Ala_T4, Ala_T5**: Concentración del aminoácido alanina.
- **PC.aa.C32.1_T0, PC.aa.C32.1_T2, ...**: Diferentes lípidos detectados en los análisis metabolómicos.

## Notas sobre los Datos Faltantes
Algunas variables contienen valores faltantes, denotados por `NA` o por valores no numéricos. Estos pueden ser el resultado de límites de detección o de mediciones no realizadas en todos los pacientes.

## Referencias
Este dataset es parte del estudio publicado por [Autore et al., 2018], que investiga el impacto de la cirugía bariátrica en los perfiles metabolómicos de pacientes con obesidad severa.

**Repositorio Original**: [Repositorio del Estudio en Github](https://github.com/nutrimetabolomics/Metabotyping2018)

---

_Este archivo describe el contenido, estructura y las características clave del dataset para su uso en análisis futuros._

