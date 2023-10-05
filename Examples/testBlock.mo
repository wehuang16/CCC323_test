within CCC323_test.Examples;
model testBlock
  Modelica.Blocks.Sources.Constant const1(k=0.1)
    annotation (Placement(transformation(extent={{-70,12},{-50,32}})));
  exampleInputOutput2 exampleInputOutput2_1
    annotation (Placement(transformation(extent={{-28,10},{-8,30}})));
equation
  connect(const1.y, exampleInputOutput2_1.u1) annotation (Line(points={{-49,22},
          {-40,22},{-40,23.8},{-30,23.8}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=86400, Interval=60));
end testBlock;
