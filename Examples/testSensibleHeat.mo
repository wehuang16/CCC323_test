within weiping_CCC323_test.Examples;
model testSensibleHeat
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal = 0.2 "Nominal mass flowrate of Tes";
  Buildings.Fluid.Sources.MassFlowSource_T boundary(
    redeclare package Medium = Buildings.Media.Antifreeze.PropyleneGlycolWater
        (property_T=293.15, X_a=0.50),
    use_m_flow_in=false,
    m_flow=1,
    T=274.15,
    nPorts=1) annotation (Placement(transformation(extent={{-80,24},{-60,44}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTem1(redeclare package Medium =
        Buildings.Media.Antifreeze.PropyleneGlycolWater (property_T=293.15, X_a=
           0.50), m_flow_nominal=1)
    annotation (Placement(transformation(extent={{-46,22},{-26,42}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package Medium =
        Buildings.Media.Antifreeze.PropyleneGlycolWater (property_T=293.15, X_a=
           0.50), m_flow_nominal=1)
    annotation (Placement(transformation(extent={{36,12},{56,32}})));
  Buildings.Fluid.HeatExchangers.Heater_T hea(
    redeclare package Medium = Buildings.Media.Antifreeze.PropyleneGlycolWater
        (property_T=293.15, X_a=0.50),
    m_flow_nominal=1,
    dp_nominal=0)
    annotation (Placement(transformation(extent={{-2,18},{18,38}})));
  Modelica.Blocks.Sources.Constant const(k=273.15 + 2)
    annotation (Placement(transformation(extent={{-44,68},{-24,88}})));
  Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium =
        Buildings.Media.Antifreeze.PropyleneGlycolWater (property_T=293.15, X_a=
           0.50), nPorts=1)    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={86,20})));
equation
  connect(boundary.ports[1], senTem1.port_a) annotation (Line(points={{-60,34},
          {-54,34},{-54,32},{-46,32}}, color={0,127,255}));
  connect(senTem1.port_b, hea.port_a) annotation (Line(points={{-26,32},{-14,32},
          {-14,28},{-2,28}}, color={0,127,255}));
  connect(hea.port_b, senTem.port_a) annotation (Line(points={{18,28},{28,28},{
          28,22},{36,22}}, color={0,127,255}));
  connect(const.y, hea.TSet) annotation (Line(points={{-23,78},{-14,78},{-14,36},
          {-4,36}}, color={0,0,127}));
  connect(senTem.port_b, bou.ports[1]) annotation (Line(points={{56,22},{66,22},
          {66,20},{76,20}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=86400, Interval=60));
end testSensibleHeat;
