within CCC323_test.Examples;
model pcmChargeTest
  pcmCharge pcmCharge1
    annotation (Placement(transformation(extent={{0,-42},{24,-18}})));
  Modelica.Blocks.Sources.Constant const3(k=273.15 + 9)
    annotation (Placement(transformation(extent={{-50,-30},{-30,-10}})));
  Modelica.Blocks.Sources.Constant const4(k=0.1)
    annotation (Placement(transformation(extent={{-44,-74},{-24,-54}})));
equation
  connect(const3.y, pcmCharge1.T_inlet) annotation (Line(points={{-29,-20},{-16,
          -20},{-16,-21.6},{-2,-21.6}}, color={0,0,127}));
  connect(const4.y, pcmCharge1.m_flow) annotation (Line(points={{-23,-64},{-12,
          -64},{-12,-28},{-2,-28}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=86400, Interval=60));
end pcmChargeTest;
