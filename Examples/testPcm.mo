within weiping_CCC323_test.Examples;
model testPcm
  replaceable package MediumWater=Buildings.Media.Water "Water medium";
  replaceable package MediumAir=Buildings.Media.Air "Air medium";
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal = 0.2 "Nominal mass flowrate of Tes";
  RTUPCM.Fluid.HeatExchangers.BaseClasses.CoilRegisterFourPort
                                                        pcmFourPort(
    m1_flow_nominal=m_flow_nominal/2,
    m2_flow_nominal=m_flow_nominal/2,
    TStart_pcm=274.15,
    Design(Tes_nominal=22.829*3600000, PCM(
        k=matPro.kPCMCoo,
        c=matPro.cPCMCoo,
        d=matPro.dPCMCoo,
        LHea=matPro.LHeaCoo,
        TSol=matPro.TSolCoo,
        TLiq=matPro.TLiqCoo)))         annotation (Placement(transformation(
        extent={{13,13},{-13,-13}},
        rotation=180,
        origin={-3,35})));
  Buildings.Fluid.Sources.MassFlowSource_T boundary(
    redeclare package Medium = Buildings.Media.Antifreeze.PropyleneGlycolWater
        (property_T=293.15, X_a=0.50),
    use_m_flow_in=true,
    m_flow=0.8*m_flow_nominal,
    T=301.15,
    nPorts=1) annotation (Placement(transformation(extent={{-80,24},{-60,44}})));
  Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium =
        Buildings.Media.Antifreeze.PropyleneGlycolWater (property_T=293.15, X_a=
           0.50), nPorts=1)    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={94,32})));
  RTUPCM.HVAC.Examples.Data.BaseClasses.MAPR matPro
    annotation (Placement(transformation(extent={{70,80},{90,100}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package Medium =
        Buildings.Media.Antifreeze.PropyleneGlycolWater (property_T=293.15, X_a=
           0.50), m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{38,12},{58,32}})));
  Modelica.Blocks.Continuous.Integrator integrator
    annotation (Placement(transformation(extent={{80,-60},{100,-40}})));
  Modelica.Blocks.Sources.Constant const(k=0.8*m_flow_nominal)
    annotation (Placement(transformation(extent={{18,-62},{38,-42}})));
  Modelica.Blocks.Sources.Constant const1(k=3530.2)
    annotation (Placement(transformation(extent={{18,-94},{38,-74}})));
  Modelica.Blocks.Math.Add add(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{18,-34},{38,-14}})));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu=3)
    annotation (Placement(transformation(extent={{52,-58},{64,-46}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-78,-4},{-58,16}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-96,-74},{-76,-54}})));
  Modelica.Blocks.Logical.LessEqualThreshold lessEqualThreshold(threshold=30.8*
        3600000)
    annotation (Placement(transformation(extent={{-30,-66},{-10,-46}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTem1(redeclare package Medium =
        Buildings.Media.Antifreeze.PropyleneGlycolWater (property_T=293.15, X_a=
           0.50), m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-46,44},{-26,64}})));
  Modelica.Blocks.Continuous.Integrator integrator1
    annotation (Placement(transformation(extent={{74,-24},{94,-4}})));
  Modelica.Blocks.Math.MultiProduct multiProduct1(nu=3)
    annotation (Placement(transformation(extent={{52,-20},{64,-8}})));
equation
  connect(pcmFourPort.port_b1, senTem.port_a) annotation (Line(points={{10,
          40.46},{24,40.46},{24,22},{38,22}}, color={0,127,255}));
  connect(pcmFourPort.port_b2, senTem.port_a) annotation (Line(points={{-16,
          29.54},{-30,29.54},{-30,28},{-40,28},{-40,12},{38,12},{38,22}}, color=
         {0,127,255}));
  connect(senTem.port_b, bou.ports[1]) annotation (Line(points={{58,22},{68,22},
          {68,32},{84,32}}, color={0,127,255}));
  connect(senTem.T, add.u2) annotation (Line(points={{48,33},{48,36},{28,36},{
          28,-6},{12,-6},{12,-30},{16,-30}}, color={0,0,127}));
  connect(multiProduct.y, integrator.u) annotation (Line(points={{65.02,-52},{
          72,-52},{72,-50},{78,-50}}, color={0,0,127}));
  connect(add.y, multiProduct.u[1]) annotation (Line(points={{39,-24},{44,-24},
          {44,-49.2},{52,-49.2}}, color={0,0,127}));
  connect(const.y, multiProduct.u[2]) annotation (Line(points={{39,-52},{46,-52},
          {46,-52},{52,-52}}, color={0,0,127}));
  connect(const1.y, multiProduct.u[3]) annotation (Line(points={{39,-84},{46,
          -84},{46,-54.8},{52,-54.8}}, color={0,0,127}));
  connect(switch1.u1, const.y) annotation (Line(points={{-80,14},{-94,14},{-94,
          -38},{28,-38},{28,-52},{39,-52}}, color={0,0,127}));
  connect(const3.y, switch1.u3) annotation (Line(points={{-75,-64},{-78,-64},{
          -78,-2},{-80,-2}}, color={0,0,127}));
  connect(switch1.y, boundary.m_flow_in) annotation (Line(points={{-57,6},{-54,
          6},{-54,24},{-88,24},{-88,42},{-82,42}}, color={0,0,127}));
  connect(integrator.y, lessEqualThreshold.u) annotation (Line(points={{101,-50},
          {104,-50},{104,-92},{-42,-92},{-42,-56},{-32,-56}}, color={0,0,127}));
  connect(lessEqualThreshold.y, switch1.u2) annotation (Line(points={{-9,-56},{
          -4,-56},{-4,-24},{-88,-24},{-88,6},{-80,6}}, color={255,0,255}));
  connect(senTem1.port_b, pcmFourPort.port_a1) annotation (Line(points={{-26,54},
          {-22,54},{-22,40.46},{-16,40.46}}, color={0,127,255}));
  connect(senTem1.port_b, pcmFourPort.port_a2) annotation (Line(points={{-26,54},
          {-12,54},{-12,60},{16,60},{16,29.54},{10,29.54}}, color={0,127,255}));
  connect(senTem1.T, add.u1) annotation (Line(points={{-36,65},{-36,70},{-48,70},
          {-48,-18},{16,-18}}, color={0,0,127}));
  connect(boundary.ports[1], senTem1.port_a) annotation (Line(points={{-60,34},
          {-54,34},{-54,54},{-46,54}}, color={0,127,255}));
  connect(multiProduct1.y, integrator1.u)
    annotation (Line(points={{65.02,-14},{72,-14}}, color={0,0,127}));
  connect(add.y, multiProduct1.u[1]) annotation (Line(points={{39,-24},{46,-24},
          {46,-11.2},{52,-11.2}}, color={0,0,127}));
  connect(const1.y, multiProduct1.u[2]) annotation (Line(points={{39,-84},{39,
          -50},{52,-50},{52,-14}}, color={0,0,127}));
  connect(switch1.y, multiProduct1.u[3]) annotation (Line(points={{-57,6},{-8,6},
          {-8,0},{48,0},{48,-16.8},{52,-16.8}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=86400, Interval=60));
end testPcm;
