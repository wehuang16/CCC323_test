within CCC323_test.Examples;
model testPcm
  replaceable package MediumWater=Buildings.Media.Water "Water medium";
  replaceable package MediumAir=Buildings.Media.Air "Air medium";
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal = 0.5 "Nominal mass flowrate of Tes";
  parameter Modelica.SIunits.Temperature T_inlet = 273.15+0.1 "T_inlet";
  BaseClasses.CoilRegisterFourPort                      pcmFourPort(
    m1_flow_nominal=m_flow_nominal/2,
    m2_flow_nominal=m_flow_nominal/2,
    TStart_pcm=294.15,
    Design(Tes_nominal=12.797*3600000, PCM(
        k=matPro.kPCMCoo,
        c=2185,
        d=matPro.dPCMCoo,
        LHea=matPro.LHeaCoo,
        TSol=matPro.TSolCoo,
        TLiq=matPro.TLiqCoo)),
    redeclare package Medium = Buildings.Media.Antifreeze.PropyleneGlycolWater
        (property_T=284.15, X_a=0.50)) annotation (Placement(transformation(
        extent={{13,13},{-13,-13}},
        rotation=180,
        origin={-7,37})));



  Buildings.Fluid.Sources.MassFlowSource_T boundary(
    redeclare package Medium = Buildings.Media.Antifreeze.PropyleneGlycolWater
        (property_T=284.15, X_a=0.50),
    use_m_flow_in=true,
    m_flow=0.8*m_flow_nominal,
    T=T_inlet,
    nPorts=1) annotation (Placement(transformation(extent={{-106,24},{-86,44}})));
  Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium =
        Buildings.Media.Antifreeze.PropyleneGlycolWater (property_T=284.15, X_a=
           0.50), nPorts=2)    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={94,32})));
  RTUPCM.HVAC.Examples.Data.BaseClasses.MAPR matPro
    annotation (Placement(transformation(extent={{70,80},{90,100}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package Medium =
        Buildings.Media.Antifreeze.PropyleneGlycolWater (property_T=284.15, X_a=
           0.50), m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{38,12},{58,32}})));
  Modelica.Blocks.Continuous.Integrator integrator
    annotation (Placement(transformation(extent={{80,-60},{100,-40}})));
  Modelica.Blocks.Sources.Constant const(k=1.5)
    annotation (Placement(transformation(extent={{18,-62},{38,-42}})));
  Modelica.Blocks.Sources.Constant const1(k=3530.2)
    annotation (Placement(transformation(extent={{38,-88},{58,-68}})));
  Modelica.Blocks.Math.Add add(k1=-1, k2=+1)
    annotation (Placement(transformation(extent={{18,-34},{38,-14}})));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu=3)
    annotation (Placement(transformation(extent={{52,-58},{64,-46}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-78,-4},{-58,16}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-96,-74},{-76,-54}})));
  Modelica.Blocks.Logical.LessEqualThreshold lessEqualThreshold(threshold=30.8*3600000)
    annotation (Placement(transformation(extent={{-30,-66},{-10,-46}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTem1(redeclare package Medium =
        Buildings.Media.Antifreeze.PropyleneGlycolWater (property_T=284.15, X_a=
           0.50), m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-46,44},{-26,64}})));
  Buildings.Fluid.Sources.MassFlowSource_T boundary1(
    redeclare package Medium = Buildings.Media.Antifreeze.PropyleneGlycolWater
        (property_T=284.15, X_a=0.50),
    use_m_flow_in=true,
    m_flow=0.8*m_flow_nominal,
    T=T_inlet,
    nPorts=1) annotation (Placement(transformation(extent={{-82,60},{-62,80}})));
  Modelica.Blocks.Sources.Constant const2(k=T_inlet + 1)
    annotation (Placement(transformation(extent={{-50,92},{-30,112}})));
  Buildings.Fluid.HeatExchangers.Heater_T hea(
    redeclare package Medium = Buildings.Media.Antifreeze.PropyleneGlycolWater
        (property_T=284.15, X_a=0.50),
    m_flow_nominal=m_flow_nominal,
    dp_nominal=0)
    annotation (Placement(transformation(extent={{-14,68},{6,88}})));
  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{56,-20},{76,0}})));
  Buildings.Fluid.Sensors.DensityTwoPort senDen(redeclare package Medium =
        Buildings.Media.Antifreeze.PropyleneGlycolWater (property_T=284.15, X_a=
           0.50), m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-78,30},{-58,50}})));
equation
  connect(pcmFourPort.port_b1, senTem.port_a) annotation (Line(points={{6,42.46},
          {24,42.46},{24,22},{38,22}},        color={0,127,255}));
  connect(pcmFourPort.port_b2, senTem.port_a) annotation (Line(points={{-20,31.54},
          {-30,31.54},{-30,28},{-40,28},{-40,12},{38,12},{38,22}},        color=
         {0,127,255}));
  connect(senTem.port_b, bou.ports[1]) annotation (Line(points={{58,22},{68,22},
          {68,30},{84,30}}, color={0,127,255}));
  connect(senTem.T, add.u2) annotation (Line(points={{48,33},{48,36},{28,36},{
          28,-6},{12,-6},{12,-30},{16,-30}}, color={0,0,127}));
  connect(multiProduct.y, integrator.u) annotation (Line(points={{65.02,-52},{
          72,-52},{72,-50},{78,-50}}, color={0,0,127}));
  connect(add.y, multiProduct.u[1]) annotation (Line(points={{39,-24},{44,-24},{
          44,-49.2},{52,-49.2}},  color={0,0,127}));
  connect(const.y, multiProduct.u[2]) annotation (Line(points={{39,-52},{46,-52},
          {46,-52},{52,-52}}, color={0,0,127}));
  connect(switch1.u1, const.y) annotation (Line(points={{-80,14},{-94,14},{-94,
          -38},{28,-38},{28,-52},{39,-52}}, color={0,0,127}));
  connect(const3.y, switch1.u3) annotation (Line(points={{-75,-64},{-78,-64},{
          -78,-2},{-80,-2}}, color={0,0,127}));
  connect(switch1.y, boundary.m_flow_in) annotation (Line(points={{-57,6},{-54,6},
          {-54,24},{-88,24},{-88,42},{-108,42}},   color={0,0,127}));
  connect(integrator.y, lessEqualThreshold.u) annotation (Line(points={{101,-50},
          {104,-50},{104,-92},{-42,-92},{-42,-56},{-32,-56}}, color={0,0,127}));
  connect(lessEqualThreshold.y, switch1.u2) annotation (Line(points={{-9,-56},{
          -4,-56},{-4,-24},{-88,-24},{-88,6},{-80,6}}, color={255,0,255}));
  connect(senTem1.port_b, pcmFourPort.port_a1) annotation (Line(points={{-26,54},
          {-22,54},{-22,42.46},{-20,42.46}}, color={0,127,255}));
  connect(senTem1.port_b, pcmFourPort.port_a2) annotation (Line(points={{-26,54},
          {-12,54},{-12,60},{16,60},{16,31.54},{6,31.54}},  color={0,127,255}));
  connect(senTem1.T, add.u1) annotation (Line(points={{-36,65},{-36,70},{-48,70},
          {-48,-18},{16,-18}}, color={0,0,127}));
  connect(switch1.y, boundary1.m_flow_in) annotation (Line(points={{-57,6},{-54,
          6},{-54,56},{-94,56},{-94,78},{-84,78}}, color={0,0,127}));
  connect(const2.y, hea.TSet) annotation (Line(points={{-29,102},{-24,102},{-24,
          86},{-16,86}}, color={0,0,127}));
  connect(boundary1.ports[1], hea.port_a) annotation (Line(points={{-62,70},{-38,
          70},{-38,78},{-14,78}}, color={0,127,255}));
  connect(hea.port_b, bou.ports[2]) annotation (Line(points={{6,78},{40,78},{40,
          72},{78,72},{78,34},{84,34}}, color={0,127,255}));
  connect(const.y, division.u2) annotation (Line(points={{39,-52},{46,-52},{46,-16},
          {54,-16}}, color={0,0,127}));
  connect(hea.Q_flow, division.u1) annotation (Line(points={{7,86},{32,86},{32,82},
          {46,82},{46,-4},{54,-4}}, color={0,0,127}));
  connect(division.y, multiProduct.u[3]) annotation (Line(points={{77,-10},{82,-10},
          {82,-34},{52,-34},{52,-54.8}}, color={0,0,127}));
  connect(boundary.ports[1], senDen.port_a) annotation (Line(points={{-86,34},{-82,
          34},{-82,40},{-78,40}}, color={0,127,255}));
  connect(senDen.port_b, senTem1.port_a) annotation (Line(points={{-58,40},{-52,
          40},{-52,54},{-46,54}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=86400, Interval=60));
end testPcm;
