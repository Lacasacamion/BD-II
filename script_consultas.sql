-- 4.1.1 – Partes que no son de París y pesan más de 10
BEGIN
  partes_fuera_paris_peso_alto;
END;
/

-- 4.1.2 – Peso en gramos para una parte específica (ejemplo con P1)
SELECT peso_en_gramos('P1') AS peso_gramos FROM dual;
/

-- 4.1.3 – Detalle completo de proveedores
BEGIN
  detalle_proveedores;
END;
/

-- 4.1.4 – Combinaciones de proveedores y partes co-localizados
BEGIN
  proveedores_partes_colocalizados;
END;
/

-- 4.1.5 – Pares de ciudades proveedor/parte
BEGIN
  pares_ciudades_abastecimiento;
END;
/

-- 4.1.6 – Pares de proveedores co-localizados
BEGIN
  proveedores_colocalizados;
END;
/

-- 4.1.7 – Número total de proveedores
SELECT total_proveedores FROM dual;
/

-- 4.1.8 – Cantidad mínima y máxima para la parte P2
BEGIN
  min_max_p2;
END;
/

-- 4.1.9 – Total despachado por parte
BEGIN
  total_despachado_por_parte;
END;
/

-- 4.1.10 – Partes abastecidas por más de un proveedor
BEGIN
  partes_multi_proveedor;
END;
/

-- 4.1.11 – Nombre de proveedores que abastecen la parte P2
BEGIN
  proveedores_para_p2;
END;
/

-- 4.1.12 – Nombre de proveedores que abastecen al menos una parte
BEGIN
  proveedores_activos;
END;
/

-- 4.1.13 – Número de proveedor con estado menor al máximo
BEGIN
  proveedores_estado_menor;
END;
/

-- 4.1.14 – Nombre de proveedores que abastecen P2 (usando EXISTS)
BEGIN
  proveedores_exist_p2;
END;
/

-- 4.1.15 – Nombre de proveedores que NO abastecen P2
BEGIN
  proveedores_sin_p2;
END;
/

-- 4.1.16 – Nombre de proveedores que abastecen todas las partes
BEGIN
  proveedores_todas_partes;
END;
/

-- 4.1.17 – Número de parte que pesa >16 libras o es abastecida por S2
BEGIN
  partes_peso_o_s2;
END;
/