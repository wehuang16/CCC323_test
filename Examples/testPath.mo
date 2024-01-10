within CCC323_test.Examples;
model testPath
  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weather(filNam=
        Modelica.Utilities.Files.loadResource(
        "modelica://hil_flexlab_model/Resources/weatherdata/US_Berkeley_20210913.mos"))
    annotation (Placement(transformation(extent={{-56,6},{-36,26}})));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=86400,
      Interval=60,
      __Dymola_Algorithm="Dassl"));
end testPath;
