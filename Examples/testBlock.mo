within CCC323_test.Examples;
model testBlock
  BaseClasses.testPcm2 testPcm2_1
    annotation (Placement(transformation(extent={{-12,2},{8,22}})));
  Modelica.Blocks.Sources.Constant const1(k=0.1)
    annotation (Placement(transformation(extent={{-70,12},{-50,32}})));
equation
  connect(const1.y, testPcm2_1.m_flow) annotation (Line(points={{-49,22},{-32,
          22},{-32,15},{-14,15}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=86400, Interval=60));
end testBlock;
