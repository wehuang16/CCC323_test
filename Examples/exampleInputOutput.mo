within CCC323_test.Examples;
model exampleInputOutput
  Modelica.Blocks.Interfaces.RealInput u1
    annotation (Placement(transformation(extent={{-140,18},{-100,58}})));
  Modelica.Blocks.Interfaces.RealOutput y1
    annotation (Placement(transformation(extent={{100,26},{120,46}})));
  Modelica.Blocks.Interfaces.RealInput u2
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealOutput y2
    annotation (Placement(transformation(extent={{100,-2},{120,18}})));
  Modelica.Blocks.Interfaces.RealOutput y5
    annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
  Modelica.Blocks.Interfaces.RealOutput y6
    annotation (Placement(transformation(extent={{100,-68},{120,-48}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=100,
    duration=43200,
    offset=0,
    startTime=21600)
    annotation (Placement(transformation(extent={{20,42},{40,62}})));
  Modelica.Blocks.Sources.Ramp ramp1(
    height=-100,
    duration=43200,
    offset=100,
    startTime=21600)
    annotation (Placement(transformation(extent={{24,-2},{44,18}})));
equation
  connect(y2, y2) annotation (Line(points={{110,8},{110,8}}, color={0,0,127}));
  connect(u1, y5) annotation (Line(points={{-120,38},{-10,38},{-10,-30},{110,
          -30}}, color={0,0,127}));
  connect(u2, y6) annotation (Line(points={{-120,-60},{-6,-60},{-6,-58},{110,
          -58}}, color={0,0,127}));
  connect(ramp.y, y1) annotation (Line(points={{41,52},{70,52},{70,36},{110,36}},
        color={0,0,127}));
  connect(ramp1.y, y2)
    annotation (Line(points={{45,8},{74,8},{74,8},{110,8}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end exampleInputOutput;
