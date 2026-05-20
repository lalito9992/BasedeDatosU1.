INSERT INTO usuario (cedula, nombre, correo, telefono, rol, clave_unica, direccion_envio, fecha_registro)
VALUES 
("110238767", "Eduardo", "morenocuencaeduardo@gmail.com", "0959546025", "comprador", 124153, "las pitas", "2006-04-17"),
("1103687360", "Luis", "luis.R@gmail.com", "0989724740", "administrador", 662, "La Pradera", "2006-04-28"),
("1150711313", "Alisson", "aligaona04@gmail.com", "0993842741", "comprador", 225, "La Banda", "2006-04-20"),
("11977876778", "Lisbeth", "lisbeth.g@gmail.com", "0987867655", "comprador", 124153, "Zamora", "2006-08-10"),
("17982921829", "Ana", "ana.j@gmail.com", "09848848284", "vendedor", 3233, "Colinas Lojanas", "2008-12-10");

INSERT INTO proveedor (cedula, nombre_empresa, correo, telefono, direccion)
VALUES 
("112822088001", "Suplementos NutriFit S.A", "nutrifits@gmail.com", "0967543216", "quito"),
("115237832001", "SuplementPro", "pros@gmail.com", "0963781815", "Loja"),
("119872362001", "Laboratorios XYZ", "xyzlab@gmail.com", "0938902102", "Guayaquil"),
("119839371001", "VitalS", "VitalityS@gmail.com", "0973892820", "Quito"),
("116666515001", "Aestethic 6 G", "6gigant@gmail.com", "0986283929", "Cuenca");

INSERT INTO suplemento (codigo, nombre_producto, marca, tipo_suplemento, precio_venta, stock, fecha_vencimiento)
VALUES 
("PROT-ON-01", "100% Whey Gold Standard", "Optimum Nutrition", "Proteina", 74.99, 50, "2027-12-01"),
("CREA-MT-02", "Creatine Micronized", "Muscletech", "Creatina", 29.50, 40, "2027-08-15"),
("PRE-C4-03", "C4 Original Pre-Workout", "Cellucor", "Pre-entreno", 38.00, 30, "2027-05-20"),
("MULT-VA-04", "Opti-Men Multivitamin", "Optimum Nutrition", "Multivitaminico", 24.50, 25, "2028-01-10"),
("AMINO-BCAA-05", "BCAA Energy", "EVLution Nutrition", "Aminoacidos", 19.99, 15, "2027-10-05");

INSERT INTO promocion (motivo_promocion, porcentaje_descuento, fecha_inicio, fecha_fin)
VALUES 
("Black Friday", 20.00, "2026-11-25", "2026-11-30"),
("Inauguracion de Tienda", 15.50, "2026-06-01", "2026-06-07"),
("Navidad Fitness", 25.00, "2026-12-15", "2026-12-25"),
("Liquidacion de Stock", 30.00, "2026-07-01", "2026-07-15"),
("Aniversario NutriFit", 10.00, "2026-09-10", "2026-09-12");

INSERT INTO factura (metodo_pago, total_parcial, iva, total)
VALUES 
("Tarjeta de Credito", 179.48, 21.54, 201.02),
("Efectivo", 38.00, 4.56, 42.56),
("Transferencia Bancaria", 74.99, 9.00, 83.99),
("Efectivo", 73.50, 8.82, 82.32),
("Tarjeta de Debito", 29.50, 3.54, 33.04);

INSERT INTO compra (fecha, estado_compra, cedula_usuario) 
VALUES 
("2026-05-10 10:30:00", "Completado", "1103687360"),
("2026-05-12 14:15:22", "Pendiente", "1150711313"),
("2026-05-14 09:00:00", "Completado", "110238767"),
("2026-05-15 18:45:12", "Cancelado", "1150711313"),
("2026-05-17 11:20:00", "Completado", "1103687360");

INSERT INTO detalle_venta (id_compra, codigo_suplemento, cantidad_total, precio_unitario, precio_total)
VALUES 
(1, "PROT-ON-01", 2, 74.99, 149.98),
(1, "CREA-MT-02", 1, 29.50, 29.50),
(2, "PRE-C4-03", 1, 38.00, 38.00),
(3, "PROT-ON-01", 1, 74.99, 74.99),
(4, "MULT-VA-04", 3, 24.50, 73.50);

INSERT INTO proveedor_suplemento (cedula_proveedor, codigo_suplemento, costo)
VALUES 
("112822088001", "PROT-ON-01", 52.00),
("115237832001", "PROT-ON-01", 54.50),
("115237832001", "CREA-MT-02", 18.00),
("119872362001", "PRE-C4-03", 24.00),
("119839371001", "MULT-VA-04", 14.20);

INSERT INTO suplemento_promocion (codigo_suplemento, id_promocion)
VALUES 
("PROT-ON-01", 1),
("CREA-MT-02", 1),
("PRE-C4-03", 2),
("PROT-ON-01", 3),
("MULT-VA-04", 4);
