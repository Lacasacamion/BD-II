-- Activar salida de DBMS_OUTPUT
SET SERVEROUTPUT ON;

-- 1. Probar paquete employee_pkg
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- PRUEBA: Crear empleado ---');
  employee_pkg.crear_empleado(120, 'Test', 'User', 'tuser@example.com', SYSDATE, 'SA_REP', 5000);

  DBMS_OUTPUT.PUT_LINE('--- PRUEBA: Leer empleado ---');
  employee_pkg.leer_empleado(120);

  DBMS_OUTPUT.PUT_LINE('--- PRUEBA: Actualizar salario ---');
  employee_pkg.actualizar_salario(120, 5500);
  employee_pkg.leer_empleado(120);

  DBMS_OUTPUT.PUT_LINE('--- PRUEBA: Eliminar empleado ---');
  employee_pkg.eliminar_empleado(120);
END;
/

-- 2. Probar procedimiento de rotaciones
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- PRUEBA: Empleados con más rotaciones ---');
  empleados_mas_rotaciones;
END;
/

-- 3. Probar función de contrataciones por mes
DECLARE
  v_total NUMBER;
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- PRUEBA: Promedio de contrataciones por mes ---');
  v_total := promedio_contrataciones_mes;
  DBMS_OUTPUT.PUT_LINE('Meses procesados: ' || v_total);
END;
/

-- 4. Probar procedimiento de resumen regional
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- PRUEBA: Resumen por región ---');
  resumen_regional;
END;
/

-- 5. Probar función de vacaciones por tiempo de servicio
DECLARE
  v_total_vacaciones NUMBER;
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- PRUEBA: Vacaciones por tiempo de servicio ---');
  v_total_vacaciones := calcular_vacaciones;
  DBMS_OUTPUT.PUT_LINE('Total acumulado de meses de vacaciones: ' || v_total_vacaciones);
END;
/

-- 6. Probar función de horas laboradas
DECLARE
  v_horas NUMBER;
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- PRUEBA: Horas laboradas en octubre 2025 ---');
  v_horas := horas_laboradas(101, 10, 2025);
  DBMS_OUTPUT.PUT_LINE('Empleado 101 trabajó: ' || v_horas || ' horas');
END;
/

-- 7. Probar función de horas faltantes
DECLARE
  v_faltantes NUMBER;
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- PRUEBA: Horas faltantes en octubre 2025 ---');
  v_faltantes := horas_faltantes(101, 10, 2025);
  DBMS_OUTPUT.PUT_LINE('Empleado 101 faltó: ' || v_faltantes || ' horas');
END;
/

-- 8. Probar procedimiento de sueldo ajustado
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- PRUEBA: Sueldo ajustado por horas trabajadas ---');
  reporte_sueldo_mes(10, 2025);
END;
/

-- 9. Probar función de horas de capacitación
DECLARE
  v_empleados NUMBER;
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- PRUEBA: Horas de capacitación por empleado ---');
  v_empleados := horas_capacitacion_empleado;
  DBMS_OUTPUT.PUT_LINE('Total de empleados capacitados: ' || v_empleados);
END;
/

-- 10. Probar procedimiento de reporte de capacitaciones
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- PRUEBA: Reporte de capacitaciones por empleado ---');
  reporte_capacitaciones;
END;
/

-- 11. Probar trigger VALIDAR_ASISTENCIA (inserción válida)
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- PRUEBA: Inserción válida en asistencia_empleado ---');
  INSERT INTO asistencia_empleado VALUES (
    101, 'MONDAY', TO_DATE('2025-10-20','YYYY-MM-DD'),
    TO_DATE('08:00','HH24:MI'), TO_DATE('12:00','HH24:MI')
  );
END;
/

-- 12. Probar trigger VALIDAR_ASISTENCIA (inserción inválida)
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- PRUEBA: Inserción inválida en asistencia_empleado ---');
  INSERT INTO asistencia_empleado VALUES (
    101, 'MONDAY', TO_DATE('2025-10-20','YYYY-MM-DD'),
    TO_DATE('09:00','HH24:MI'), TO_DATE('13:00','HH24:MI')
  );
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error esperado: ' || SQLERRM);
END;
/

-- 13. Probar trigger VALIDAR_RANGO_SALARIAL (inserción válida)
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- PRUEBA: Inserción válida con salario dentro del rango ---');
  INSERT INTO employees VALUES (
    121, 'Valid', 'Salary', 'vsalary@example.com', '555-0000',
    SYSDATE, 'SA_REP', 5000, NULL, NULL, 10
  );
  DELETE FROM employees WHERE employee_id = 121;
END;
/

-- 14. Probar trigger VALIDAR_RANGO_SALARIAL (inserción inválida)
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- PRUEBA: Inserción inválida con salario fuera de rango ---');
  INSERT INTO employees VALUES (
    122, 'Invalid', 'Salary', 'isalary@example.com', '555-0001',
    SYSDATE, 'SA_REP', 10000, NULL, NULL, 10
  );
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error esperado: ' || SQLERRM);
END;
/