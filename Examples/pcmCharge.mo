within CCC323_test.Examples;
model pcmCharge
  replaceable package MediumWater=Buildings.Media.Water "Water medium";
  replaceable package MediumAir=Buildings.Media.Air "Air medium";
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal = 0.5 "Nominal mass flowrate of Tes";
  BaseClasses.CoilRegisterFourPort                      pcmFourPort(
    m1_flow_nominal=m_flow_nominal/2,
    m2_flow_nominal=m_flow_nominal/2,
    TStart_pcm=294.15,
    Design(Tes_nominal=22.829*3600000, PCM(
        k=matPro.kPCMCoo,
        c=2116,
        d=matPro.dPCMCoo,
        LHea=matPro.LHeaCoo,
        TSol=matPro.TSolCoo,
        TLiq=matPro.TLiqCoo)),
    redeclare package Medium =
        Buildings.Media.Antifreeze.PropyleneGlycolWater (property_T=284.15, X_a=
           0.50))                      annotation (Placement(transformation(
        extent={{13,13},{-13,-13}},
        rotation=180,
        origin={-3,35})));
  Buildings.Fluid.Sources.MassFlowSource_T boundary(
    redeclare package Medium = Buildings.Media.Antifreeze.PropyleneGlycolWater
        (property_T=284.15, X_a=0.50),
    use_m_flow_in=true,
    m_flow=0.8*m_flow_nominal,
    use_T_in=true,
    T=301.15,
    nPorts=1) annotation (Placement(transformation(extent={{-80,24},{-60,44}})));
  Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium =
        Buildings.Media.Antifreeze.PropyleneGlycolWater (property_T=284.15, X_a=
           0.50), nPorts=1)    annotation (Placement(transformation(
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
  Modelica.Blocks.Sources.Constant const1(k=3495.55)
    annotation (Placement(transformation(extent={{-58,-80},{-38,-60}})));
  Modelica.Blocks.Math.Add add(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{16,-34},{36,-14}})));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu=3)
    annotation (Placement(transformation(extent={{52,-58},{64,-46}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTem1(redeclare package Medium =
        Buildings.Media.Antifreeze.PropyleneGlycolWater (property_T=284.15, X_a=
           0.50), m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-46,44},{-26,64}})));
  Modelica.Blocks.Interfaces.RealInput m_flow
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput T_inlet
    annotation (Placement(transformation(extent={{-140,44},{-100,84}})));
  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{60,-88},{80,-68}})));
  Modelica.Blocks.Sources.Constant const2(k=30.8*3600000)
    annotation (Placement(transformation(extent={{18,-94},{38,-74}})));
  Modelica.Blocks.Interfaces.RealOutput SOC
    annotation (Placement(transformation(extent={{140,-86},{160,-66}})));
  Modelica.Blocks.Interfaces.RealOutput Q_flow
    annotation (Placement(transformation(extent={{140,-20},{160,0}})));
  Modelica.Blocks.Sources.Constant const3(k=1)
    annotation (Placement(transformation(extent={{66,-130},{86,-110}})));
  Modelica.Blocks.Math.Add add1(k1=+1, k2=+1)
    annotation (Placement(transformation(extent={{108,-90},{128,-70}})));
  Modelica.Blocks.Interfaces.RealOutput T_outlet
    annotation (Placement(transformation(extent={{140,46},{160,66}})));
equation
  connect(pcmFourPort.port_b1, senTem.port_a) annotation (Line(points={{10,
          40.46},{24,40.46},{24,22},{38,22}}, color={0,127,255}));
  connect(pcmFourPort.port_b2, senTem.port_a) annotation (Line(points={{-16,
          29.54},{-30,29.54},{-30,28},{-40,28},{-40,12},{38,12},{38,22}}, color=
         {0,127,255}));
  connect(senTem.port_b, bou.ports[1]) annotation (Line(points={{58,22},{68,22},
          {68,32},{84,32}}, color={0,127,255}));
  connect(senTem.T, add.u2) annotation (Line(points={{48,33},{48,34},{24,34},{
          24,-8},{8,-8},{8,-30},{14,-30}},   color={0,0,127}));
  connect(multiProduct.y, integrator.u) annotation (Line(points={{65.02,-52},{
          72,-52},{72,-50},{78,-50}}, color={0,0,127}));
  connect(add.y, multiProduct.u[1]) annotation (Line(points={{37,-24},{44,-24},
          {44,-49.2},{52,-49.2}}, color={0,0,127}));
  connect(const1.y, multiProduct.u[2]) annotation (Line(points={{-37,-70},{46,
          -70},{46,-52},{52,-52}},     color={0,0,127}));
  connect(senTem1.port_b, pcmFourPort.port_a1) annotation (Line(points={{-26,54},
          {-22,54},{-22,40.46},{-16,40.46}}, color={0,127,255}));
  connect(senTem1.port_b, pcmFourPort.port_a2) annotation (Line(points={{-26,54},
          {-12,54},{-12,60},{16,60},{16,29.54},{10,29.54}}, color={0,127,255}));
  connect(senTem1.T, add.u1) annotation (Line(points={{-36,65},{-36,70},{-48,70},
          {-48,-18},{14,-18}}, color={0,0,127}));
  connect(boundary.ports[1], senTem1.port_a) annotation (Line(points={{-60,34},
          {-54,34},{-54,54},{-46,54}}, color={0,127,255}));
  connect(boundary.m_flow_in, m_flow) annotation (Line(points={{-82,42},{-88,42},
          {-88,0},{-120,0}}, color={0,0,127}));
  connect(m_flow, multiProduct.u[3]) annotation (Line(points={{-120,0},{-90,0},{
          -90,-54.8},{52,-54.8}}, color={0,0,127}));
  connect(boundary.T_in, T_inlet) annotation (Line(points={{-82,38},{-94,38},{-94,
          64},{-120,64}}, color={0,0,127}));
  connect(integrator.y, division.u1) annotation (Line(points={{101,-50},{106,
          -50},{106,-26},{56,-26},{56,-72},{58,-72}}, color={0,0,127}));
  connect(const2.y, division.u2)
    annotation (Line(points={{39,-84},{58,-84}}, color={0,0,127}));
  connect(multiProduct.y, Q_flow) annotation (Line(points={{65.02,-52},{66,-52},
          {66,-46},{74,-46},{74,-10},{150,-10}}, color={0,0,127}));
  connect(const3.y, add1.u1) annotation (Line(points={{87,-120},{90,-120},{90,
          -118},{96,-118},{96,-74},{106,-74}}, color={0,0,127}));
  connect(division.y, add1.u2) annotation (Line(points={{81,-78},{92.5,-78},{
          92.5,-86},{106,-86}}, color={0,0,127}));
  connect(add1.y, SOC) annotation (Line(points={{129,-80},{134,-80},{134,-76},{
          150,-76}}, color={0,0,127}));
  connect(senTem.T, T_outlet)
    annotation (Line(points={{48,33},{48,56},{150,56}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -140},{140,100}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-140},{140,
            100}})),
    experiment(StopTime=86400, Interval=60));
end pcmCharge;
