# 🅿️ XMACCING – Sistema de Gestión de Parqueaderos

**XMACCING** es un proyecto multidisciplinar desarrollado como parte del curso de Cornerstone. Su objetivo es construir un sistema inteligente de gestión y control de parqueaderos, integrando componentes de software, base de datos, diseño visual y hardware que le permitan a los vigilantes de la universidad hacer mas comodo su trabajo.

---

## 🧩 Componentes del proyecto

El proyecto está dividido en varias capas que trabajan de forma integrada:

### 🔸 1. Base de datos (PostgreSQL)
Se diseñó un modelo entidad-relación (MER) para estructurar la información clave sobre vehículos, parqueaderos, usuarios, accesos y más.

- `Script Tablas.sql`: contiene la creación de todas las tablas del sistema.
- `Pruebas Tablas.sql`: incluye inserciones y pruebas de consistencia.
- Diagrama MER visual (`MER CORNER.drawio.png`).

### 🔸 2. Interfaz de usuario (Frontend – Dash)
El frontend está construido con Python y Dash, permitiendo una visualización amigable y moderna de los datos, como:
- Registro y control de accesos.
- Disponibilidad de parqueaderos.
- Representación visual del sistema mediante renders 3D.

### 🔸 3. Diseño visual
En la carpeta **Diseño página** se encuentran versiones preliminares del diseño de la aplicación, enfocadas en la experiencia del usuario.

### 🔸 4. Renders 3D
En la carpeta **Renders/** se incluyen modelos 3D de vehículos y escenas:

- `car.gltf`, `bike.gltf`, `truck.zip`
- Texturas realistas para matrículas, superficies, etc.
- Integración prevista para vistas interactivas del parqueadero.

### 🔸 5. Electrónica y hardware
Se diseñó un sistema de placa electrónica (PCB) que puede integrarse para control de barreras físicas o sensores de entrada.

- Carpeta: `Placa Electrónica/`
- Contenido: archivo `.zip` con los esquemas del circuito PCB.

---

## ⚙️ Tecnologías utilizadas

| Área             | Herramientas principales           |
|------------------|------------------------------------|
| Base de datos    | PostgreSQL, SQL                    |
| Backend          | Python                             |
| Interfaz web     | Dash (basado en Flask + Plotly)    |
| Visualización    | Renders 3D (.gltf), Texturas       |
| Hardware         | Diseño de PCB para control físico  |

---


## 🚀 Ejecución del sistema

1. Cargar las tablas con `Script Tablas.sql` en una instancia PostgreSQL local.
2. Adaptar credenciales de conexión en los scripts Python.
3. Ejecutar la aplicación Dash (`app.py`) desde tu entorno de desarrollo



🧠 Aplicación del proyecto

Este sistema fue creado para apoyar al personal de vigilancia en la administración de parqueaderos, mejorando la organización del espacio, reduciendo errores manuales y permitiendo monitoreo en tiempo real.
Su diseño apunta a ser una herramienta intuitiva, automatizada y extensible, ideal para entornos universitarios, conjuntos residenciales o empresas.
