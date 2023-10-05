within CCC323_test.Examples;
model SimpleInputOutput4
  Modelica.Blocks.Interfaces.RealInput T_inlet
    annotation (Placement(transformation(extent={{-140,18},{-100,58}})));
  Modelica.Blocks.Interfaces.RealOutput T_outlet
    annotation (Placement(transformation(extent={{100,26},{120,46}})));
  Modelica.Blocks.Sources.Constant const1(k=5)
    annotation (Placement(transformation(extent={{-64,54},{-44,74}})));
  Modelica.Blocks.Math.Add add(k1=+1, k2=+1)
    annotation (Placement(transformation(extent={{-16,24},{4,44}})));
  Modelica.Blocks.Interfaces.RealOutput T_signal
    annotation (Placement(transformation(extent={{100,-64},{120,-44}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=10,
    duration=43200,
    offset=285,
    startTime=21600)
    annotation (Placement(transformation(extent={{24,-62},{44,-42}})));
  Modelica.Blocks.Interfaces.RealInput T_inlet2
    annotation (Placement(transformation(extent={{-140,-18},{-100,22}})));
  Modelica.Blocks.Interfaces.RealInput T_inlet3
    annotation (Placement(transformation(extent={{-140,-46},{-100,-6}})));
  Modelica.Blocks.Interfaces.RealOutput T_outlet2
    annotation (Placement(transformation(extent={{100,0},{120,20}})));
  Modelica.Blocks.Interfaces.RealOutput T_outlet3
    annotation (Placement(transformation(extent={{100,-32},{120,-12}})));
  Modelica.Blocks.Math.Add add1(k1=+1, k2=+1)
    annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
  Modelica.Blocks.Math.Add add2(k1=+1, k2=+1)
    annotation (Placement(transformation(extent={{-8,-40},{12,-20}})));
equation
  connect(const1.y, add.u1) annotation (Line(points={{-43,64},{-30,64},{-30,40},
          {-18,40}}, color={0,0,127}));
  connect(T_inlet, add.u2) annotation (Line(points={{-120,38},{-70,38},{-70,28},
          {-18,28}}, color={0,0,127}));
  connect(add.y, T_outlet) annotation (Line(points={{5,34},{58,34},{58,36},{110,
          36}}, color={0,0,127}));
  connect(ramp.y, T_signal) annotation (Line(points={{45,-52},{78,-52},{78,-54},
          {110,-54}}, color={0,0,127}));
  connect(T_outlet2, T_outlet2)
    annotation (Line(points={{110,10},{110,10}}, color={0,0,127}));
  connect(T_inlet2, add1.u2) annotation (Line(points={{-120,2},{-66,2},{-66,-6},
          {-14,-6}}, color={0,0,127}));
  connect(T_inlet3, add2.u2) annotation (Line(points={{-120,-26},{-66,-26},{-66,
          -36},{-10,-36}}, color={0,0,127}));
  connect(const1.y, add1.u1) annotation (Line(points={{-43,64},{-42,64},{-42,50},
          {-38,50},{-38,6},{-14,6}}, color={0,0,127}));
  connect(const1.y, add2.u1) annotation (Line(points={{-43,64},{-38,64},{-38,
          -24},{-10,-24}}, color={0,0,127}));
  connect(add1.y, T_outlet2)
    annotation (Line(points={{9,0},{54,0},{54,10},{110,10}}, color={0,0,127}));
  connect(add2.y, T_outlet3) annotation (Line(points={{13,-30},{58,-30},{58,-22},
          {110,-22}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SimpleInputOutput4;
