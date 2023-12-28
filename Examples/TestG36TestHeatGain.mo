within CCC323_test.Examples;
model TestG36TestHeatGain
  Modelica.Blocks.Sources.CombiTimeTable ligSch(
    table=[0,0; 7,0; 7,0.5; 8,0.5; 8,0.9; 17,0.9; 17,0.5; 21,0.5; 21,0; 24,0],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "internal heat gain from lights"
    annotation (Placement(transformation(extent={{-54,-22},{-34,-2}})));
  Modelica.Blocks.Sources.CombiTimeTable pluSch(
    table=[0,0.4; 9,0.4; 9,0.9; 13,0.9; 13,0.8; 14,0.8; 14,0.9; 18,0.9; 18,0.5;
        19,0.5; 19,0.4; 24,0.4],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "internal heat gain from plug"
    annotation (Placement(transformation(extent={{-56,-118},{-36,-98}})));
  Modelica.Blocks.Sources.CombiTimeTable occSch(
    table=[0,0; 7,0; 7,0.5; 8,0.5; 8,1; 12,1; 12,0.5; 13,0.5; 13,1; 17,1; 17,
        0.5; 18,0.5; 18,0.0; 24,0.0],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "internal heat gain from occupant"
    annotation (Placement(transformation(extent={{-40,-158},{-20,-138}})));
  Modelica.Blocks.Math.MatrixGain ligGai(K=10*[0.5; 0.5; 0.0])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{70,-36},{90,-16}})));
  Modelica.Blocks.Math.MatrixGain plgGai(K=10*[0.5; 0.5; 0.0])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{60,-126},{80,-106}})));
  Modelica.Blocks.Math.MatrixGain occGai(K=14*[0.4; 0.4; 0.2])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{42,-158},{62,-138}})));
  Modelica.Blocks.Math.Add3 add3_1 "sum radiant"
    annotation (Placement(transformation(extent={{152,-88},{172,-68}})));
  Modelica.Blocks.Math.Add3 add3_2 "sum convective"
    annotation (Placement(transformation(extent={{236,-128},{256,-108}})));
  Modelica.Blocks.Math.Add3 add3_3 "sum latent"
    annotation (Placement(transformation(extent={{164,-190},{184,-170}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_1
    annotation (Placement(transformation(extent={{294,-126},{314,-106}})));
  Modelica.Blocks.Sources.CombiTimeTable occSch_corrected(
    table=[0,0; 8,0; 8,0.5; 9,0.5; 9,1; 13,1; 13,0.5; 14,0.5; 14,1; 18,1; 18,
        0.5; 19,0.5; 19,0.0; 24,0.0],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "internal heat gain from occupant"
    annotation (Placement(transformation(extent={{-30,-188},{-10,-168}})));
  Modelica.Blocks.Math.MultiSum plugGain(nu=2)
    annotation (Placement(transformation(extent={{156,42},{168,54}})));
  Modelica.Blocks.Math.Gain gain(k=10*56.9)
    annotation (Placement(transformation(extent={{12,66},{32,86}})));
  Modelica.Blocks.Math.Gain gain1(k=10*56.9)
    annotation (Placement(transformation(extent={{14,34},{34,54}})));
  Modelica.Blocks.Math.Gain gain2(k=14*56.9)
    annotation (Placement(transformation(extent={{20,6},{40,26}})));
  Modelica.Blocks.Math.MultiSum lightGain(nu=1)
    annotation (Placement(transformation(extent={{112,74},{124,86}})));
equation
  connect(ligSch.y,ligGai. u)
    annotation (Line(points={{-33,-12},{60,-12},{60,-26},{68,-26}},
                                                   color={0,0,127}));
  connect(pluSch.y,plgGai. u)
    annotation (Line(points={{-35,-108},{48,-108},{48,-116},{58,-116}},
                                                   color={0,0,127}));
  connect(ligGai.y[1],add3_1. u1) annotation (Line(points={{91,-26},{91,-80},{
          140,-80},{140,-70},{150,-70}},
                               color={0,0,127}));
  connect(plgGai.y[1],add3_1. u2) annotation (Line(points={{81,-116},{144,-116},
          {144,-78},{150,-78}},color={0,0,127}));
  connect(occGai.y[1],add3_1. u3) annotation (Line(points={{63,-148},{140,-148},
          {140,-108},{150,-108},{150,-86}},
                               color={0,0,127}));
  connect(ligGai.y[2],add3_2. u1) annotation (Line(points={{91,-26},{91,-80},{
          140,-80},{140,-110},{234,-110}},
                               color={0,0,127}));
  connect(plgGai.y[2],add3_2. u2)
    annotation (Line(points={{81,-116},{157.5,-116},{157.5,-118},{234,-118}},
                                                   color={0,0,127}));
  connect(occGai.y[2],add3_2. u3) annotation (Line(points={{63,-148},{140,-148},
          {140,-126},{234,-126}},
                               color={0,0,127}));
  connect(ligGai.y[3],add3_3. u1) annotation (Line(points={{91,-26},{91,-80},{
          140,-80},{140,-132},{148,-132},{148,-172},{162,-172}},
                               color={0,0,127}));
  connect(plgGai.y[3],add3_3. u2) annotation (Line(points={{81,-116},{144,-116},
          {144,-180},{162,-180}},
                               color={0,0,127}));
  connect(add3_1.y,multiplex3_1. u1[1]) annotation (Line(points={{173,-78},{173,
          -80},{292,-80},{292,-109}},color={0,0,127}));
  connect(add3_2.y,multiplex3_1. u2[1])
    annotation (Line(points={{257,-118},{274.5,-118},{274.5,-116},{292,-116}},
                                                   color={0,0,127}));
  connect(add3_3.y,multiplex3_1. u3[1]) annotation (Line(points={{185,-180},{
          292,-180},{292,-123}},     color={0,0,127}));
  connect(occGai.y[3], add3_3.u3) annotation (Line(points={{63,-148},{72,-148},
          {72,-188},{162,-188}}, color={0,0,127}));
  connect(occSch_corrected.y, occGai.u) annotation (Line(points={{-9,-178},{-9,
          -180},{28,-180},{28,-148},{40,-148}}, color={0,0,127}));
  connect(ligSch.y[1], gain.u) annotation (Line(points={{-33,-12},{0,-12},{0,76},
          {10,76}}, color={0,0,127}));
  connect(pluSch.y[1], gain1.u)
    annotation (Line(points={{-35,-108},{12,-108},{12,44}}, color={0,0,127}));
  connect(occSch_corrected.y[1], gain2.u) annotation (Line(points={{-9,-178},{
          -9,-180},{28,-180},{28,-8},{8,-8},{8,16},{18,16}}, color={0,0,127}));
  connect(gain1.y, plugGain.u[1]) annotation (Line(points={{35,44},{35,46.95},{
          156,46.95}}, color={0,0,127}));
  connect(gain2.y, plugGain.u[2]) annotation (Line(points={{41,16},{128,16},{
          128,49.05},{156,49.05}}, color={0,0,127}));
  connect(gain.y, lightGain.u[1]) annotation (Line(points={{33,76},{76,76},{76,
          82},{108,82},{108,80},{112,80}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-660},{360,
            100}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-660},{
            360,100}})),
    experiment(
      StopTime=172800,
      Interval=60,
      __Dymola_Algorithm="Dassl"));
end TestG36TestHeatGain;
