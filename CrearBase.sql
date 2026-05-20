CREATE DATABASE IF NOT EXISTS tienda_suplementos;
USE tienda_suplementos;

-- 1. TABLA: USUARIO (Independiente)
CREATE TABLE usuario (
    cedula VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(150) NOT NULL,
    telefono VARCHAR(15),
    rol VARCHAR(50) NOT NULL,
    clave_unica INT NOT NULL,
    direccion_envio VARCHAR(200),
    fecha_registro DATE
);

-- 2. TABLA: PROVEEDOR (Independiente)
CREATE TABLE proveedor (
    cedula VARCHAR(13) PRIMARY KEY,
    nombre_empresa VARCHAR(150) NOT NULL,
    correo VARCHAR(150),
    telefono VARCHAR(15),
    direccion VARCHAR(200)
);

-- 3. TABLA: SUPLEMENTO (Independiente)
CREATE TABLE suplemento (
    codigo VARCHAR(50) PRIMARY KEY,
    nombre_producto VARCHAR(150) NOT NULL,
    marca VARCHAR(100),
    tipo_suplemento VARCHAR(100),
    precio_venta DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    fecha_vencimiento DATE
);

-- 4. TABLA: PROMOCION (Independiente)
CREATE TABLE promocion (
    id_promocion INT AUTO_INCREMENT PRIMARY KEY,
    motivo_promocion VARCHAR(150) NOT NULL,
    porcentaje_descuento DECIMAL(5,2) NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE
);

-- 5. TABLA: COMPRA (Depende de Usuario)
CREATE TABLE compra (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME NOT NULL,
    estado_compra VARCHAR(50) NOT NULL,
    cedula_usuario VARCHAR(10),
    FOREIGN KEY (cedula_usuario) REFERENCES usuario(cedula) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 6. TABLA: FACTURA (Depende de Compra para mantener la relación 1:1)
CREATE TABLE factura (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    metodo_pago VARCHAR(50) NOT NULL,
    total_parcial DECIMAL(10,2) NOT NULL,
    iva DECIMAL(10,2) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    id_compra INT,
    FOREIGN KEY (id_compra) REFERENCES compra(id_compra) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 7. TABLA: DETALLE_VENTA (Depende de Compra y Suplemento)
CREATE TABLE detalle_venta (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_compra INT,
    codigo_suplemento VARCHAR(50),
    cantidad_total INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    precio_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_compra) REFERENCES compra(id_compra) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (codigo_suplemento) REFERENCES suplemento(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 8. TABLA INTERMEDIA: PROVEEDOR_SUPLEMENTO (Muchos a Muchos)
CREATE TABLE proveedor_suplemento (
    cedula_proveedor VARCHAR(13),
    codigo_suplemento VARCHAR(50),
    costo DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (cedula_proveedor, codigo_suplemento),
    FOREIGN KEY (cedula_proveedor) REFERENCES proveedor(cedula) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (codigo_suplemento) REFERENCES suplemento(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 9. TABLA INTERMEDIA: SUPLEMENTO_PROMOCION (Muchos a Muchos)
CREATE TABLE suplemento_promocion (
    codigo_suplemento VARCHAR(50),
    id_promocion INT,
    PRIMARY KEY (codigo_suplemento, id_promocion),
    FOREIGN KEY (codigo_suplemento) REFERENCES suplemento(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_promocion) REFERENCES promocion(id_promocion) ON DELETE CASCADE ON UPDATE CASCADE
);


