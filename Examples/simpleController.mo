within CCC323_test.Examples;
model simpleController
  Modelica.Blocks.Interfaces.RealInput u1
    annotation (Placement(transformation(extent={{-140,18},{-100,58}})));
  Modelica.Blocks.Interfaces.RealInput u2
    annotation (Placement(transformation(extent={{-140,-40},{-100,0}})));
  Modelica.Blocks.Interfaces.RealInput u3
    annotation (Placement(transformation(extent={{-140,-92},{-100,-52}})));
  Modelica.Blocks.Interfaces.RealOutput y1
    annotation (Placement(transformation(extent={{100,26},{120,46}})));
  Modelica.Blocks.Interfaces.RealOutput y2
    annotation (Placement(transformation(extent={{100,-12},{120,8}})));
  Modelica.Blocks.Interfaces.RealOutput y3
    annotation (Placement(transformation(extent={{100,-66},{120,-46}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{38,32},{58,52}})));
  Modelica.Blocks.Math.Add add1(k2=-1)
    annotation (Placement(transformation(extent={{52,-20},{72,0}})));
  Modelica.Blocks.Math.Add add2(k2=-1)
    annotation (Placement(transformation(extent={{48,-84},{68,-64}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{-36,32},{-16,52}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{-34,-40},{-14,-20}})));
  Modelica.Blocks.Math.Product product2
    annotation (Placement(transformation(extent={{-26,-82},{-6,-62}})));
  Modelica.Blocks.Sources.Constant const(k=2)
    annotation (Placement(transformation(extent={{-88,70},{-68,90}})));
  Modelica.Blocks.Sources.Constant const1(k=270)
    annotation (Placement(transformation(extent={{-2,10},{18,30}})));
  Modelica.Blocks.Sources.Constant const2(k=268)
    annotation (Placement(transformation(extent={{8,-56},{28,-36}})));
  Modelica.Blocks.Sources.Constant const3(k=266)
    annotation (Placement(transformation(extent={{8,-98},{28,-78}})));
equation
  connect(const.y, product.u2) annotation (Line(points={{-67,80},{-52,80},{-52,
          36},{-38,36}}, color={0,0,127}));
  connect(const.y, product1.u2) annotation (Line(points={{-67,80},{-52,80},{-52,
          -36},{-36,-36}}, color={0,0,127}));
  connect(const.y, product2.u2) annotation (Line(points={{-67,80},{-48,80},{-48,
          -78},{-28,-78}}, color={0,0,127}));
  connect(u1, product.u1) annotation (Line(points={{-120,38},{-80,38},{-80,48},
          {-38,48}}, color={0,0,127}));
  connect(u2, product1.u1) annotation (Line(points={{-120,-20},{-78,-20},{-78,
          -24},{-36,-24}}, color={0,0,127}));
  connect(u3, product2.u1) annotation (Line(points={{-120,-72},{-74,-72},{-74,
          -66},{-28,-66}}, color={0,0,127}));
  connect(product.y, add.u1) annotation (Line(points={{-15,42},{10,42},{10,48},
          {36,48}}, color={0,0,127}));
  connect(const1.y, add.u2) annotation (Line(points={{19,20},{28,20},{28,36},{
          36,36}}, color={0,0,127}));
  connect(product1.y, add1.u1) annotation (Line(points={{-13,-30},{18,-30},{18,
          -4},{50,-4}}, color={0,0,127}));
  connect(const2.y, add1.u2) annotation (Line(points={{29,-46},{38,-46},{38,-16},
          {50,-16}}, color={0,0,127}));
  connect(product2.y, add2.u1) annotation (Line(points={{-5,-72},{20,-72},{20,
          -68},{46,-68}}, color={0,0,127}));
  connect(const3.y, add2.u2) annotation (Line(points={{29,-88},{36,-88},{36,-80},
          {46,-80}}, color={0,0,127}));
  connect(add.y, y1) annotation (Line(points={{59,42},{80,42},{80,36},{110,36}},
        color={0,0,127}));
  connect(add1.y, y2) annotation (Line(points={{73,-10},{88,-10},{88,-2},{110,
          -2}}, color={0,0,127}));
  connect(add2.y, y3) annotation (Line(points={{69,-74},{86,-74},{86,-56},{110,
          -56}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end simpleController;
