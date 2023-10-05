within CCC323_test.Examples;
model exampleInputOutput2
  Modelica.Blocks.Interfaces.RealInput u1
    annotation (Placement(transformation(extent={{-140,18},{-100,58}})));
  Modelica.Blocks.Interfaces.RealOutput y1
    annotation (Placement(transformation(extent={{100,26},{120,46}})));
  Modelica.Blocks.Continuous.Integrator integrator
    annotation (Placement(transformation(extent={{-20,26},{0,46}})));
equation
  connect(u1, integrator.u) annotation (Line(points={{-120,38},{-70,38},{-70,36},
          {-22,36}}, color={0,0,127}));
  connect(integrator.y, y1)
    annotation (Line(points={{1,36},{110,36}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end exampleInputOutput2;
