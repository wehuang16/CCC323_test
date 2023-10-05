within CCC323_test.Examples;
model pcmDischargeTest
  pcmDischarge pcmDischarge1
    annotation (Placement(transformation(extent={{0,48},{20,68}})));
  Modelica.Blocks.Sources.Constant const1(k=273.15 + 19.28)
    annotation (Placement(transformation(extent={{-68,62},{-48,82}})));
  Modelica.Blocks.Sources.Constant const2(k=1.785)
    annotation (Placement(transformation(extent={{-62,18},{-42,38}})));
equation
  connect(const2.y, pcmDischarge1.m_flow) annotation (Line(points={{-41,28},{
          -22,28},{-22,58},{-2,58}}, color={0,0,127}));
  connect(const1.y, pcmDischarge1.T_inlet) annotation (Line(points={{-47,72},{
          -24,72},{-24,64.4},{-2,64.4}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=86400, Interval=60));
end pcmDischargeTest;
