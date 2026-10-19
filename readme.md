# 🔭 Análisis Astrofísico y Machine Learning - Gaia DR3 (ESA)

Este proyecto es un pipeline computacional automatizado que extrae, procesa y modela datos astrométricos de la misión **Gaia DR3** de la Agencia Espacial Europea (ESA). El sistema aplica transformaciones trigonométricas, astrofísica teórica y aprendizaje no supervisado para analizar la topología y termodinámica del vecindario solar.

## 🚀 Arquitectura del Sistema

El pipeline se ejecuta secuencialmente mediante orquestación en contenedores:
1. **Infraestructura (Docker):** Red virtual aislada con volúmenes persistentes, motor MySQL 8.4 y entorno Jupyter.
2. **ETL (Python/ADQL):** Extracción asincrónica desde el servidor TAP (`gea.esac.esa.int`). Ingesta normalizada en un modelo relacional estricto (Padre-Hijos) para garantizar la integridad de los datos.
3. **Motor Analítico (Streamlit & Scikit-Learn):** Interfaz matemática en tiempo real.

## 🧠 Módulos Computacionales
* **Cartografía Galáctica 3D:** Transformación del paralaje (mas) a Pársecs ($d = 1000/p$) y conversión de coordenadas ecuatoriales esféricas a un espacio métrico euclidiano $(X, Y, Z)$ centrado en el Sol.
* **Cinemática Vectorial:** Análisis de tensores de movimiento propio y distribución probabilística del corrimiento Doppler (Velocidad Radial).
* **Termodinámica Evolutiva:** Cálculo de la Magnitud Absoluta mediante el módulo de distancia ($M = m - 5 \log_{10}(d) + 5$) para revelar la verdadera luminosidad intrínseca y construir un Diagrama Hertzsprung-Russell físicamente riguroso.
* **Machine Learning:** Algoritmo no supervisado **K-Means** (Scikit-Learn) que clasifica e identifica poblaciones morfológicas basándose en la varianza térmica y fotométrica, sin etiquetado previo.

## 🛠️ Stack Tecnológico
* **Core:** Docker, MySQL 8.4, Bash Scripting.
* **Procesamiento & ML:** Python 3, Pandas, NumPy, Scikit-Learn.
* **Visualización:** Streamlit, Plotly (3D & Density).

---

# 🔭 Astrophysical Analysis & Machine Learning - Gaia DR3 (ESA)

This project is an automated computational pipeline that extracts, processes, and models astrometric data from the European Space Agency's **Gaia DR3** mission. The system applies trigonometric transformations, theoretical astrophysics, and unsupervised learning to analyze the topology and thermodynamics of the solar neighborhood.

## 🚀 System Architecture

The pipeline executes sequentially via container orchestration:
1. **Infrastructure (Docker):** Isolated virtual network with persistent volumes, MySQL 8.4 engine, and a Jupyter environment.
2. **ETL (Python/ADQL):** Asynchronous extraction from the TAP server (`gea.esac.esa.int`). Normalized ingestion into a strict relational model (Parent-Child) to ensure data integrity.
3. **Analytical Engine (Streamlit & Scikit-Learn):** Real-time mathematical interface.

## 🧠 Computational Modules
* **3D Galactic Cartography:** Transformation of parallax (mas) to Parsecs ($d = 1000/p$) and conversion of spherical equatorial coordinates to a Euclidean metric space $(X, Y, Z)$ centered on the Sun.
* **Vector Kinematics:** Analysis of proper motion tensors and probabilistic distribution of Doppler shifts (Radial Velocity).
* **Evolutionary Thermodynamics:** Calculation of Absolute Magnitude using the distance modulus ($M = m - 5 \log_{10}(d) + 5$) to reveal true intrinsic luminosity and construct a physically rigorous Hertzsprung-Russell Diagram.
* **Machine Learning:** Unsupervised **K-Means** algorithm (Scikit-Learn) that classifies and identifies morphological populations based on thermal and photometric variance, without prior labeling.

## 🛠️ Tech Stack
* **Core:** Docker, MySQL 8.4, Bash Scripting.
* **Processing & ML:** Python 3, Pandas, NumPy, Scikit-Learn.
* **Visualization:** Streamlit, Plotly (3D & Density).
