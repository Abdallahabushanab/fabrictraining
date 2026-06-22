[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared #"Sales_fabric-Hasan" = let
  Source = Sql.Database("fabricserver1.database.windows.net", "FabricB"),
  #"Navigation 1" = Source{[Schema = "dbo", Item = "sales_data_1"]}[Data]
in
  #"Navigation 1";
