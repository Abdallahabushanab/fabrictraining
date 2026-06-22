[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Customer_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared Customer = let
  Source = Sql.Database("fabricserver1.database.windows.net", "FabricB"),
  #"Navigation 1" = Source{[Schema = "dbo", Item = "Customer"]}[Data],
  #"Added custom" = Table.TransformColumnTypes(Table.AddColumn(#"Navigation 1", "Test", each 40), {{"Test", type number}})
in
  #"Added custom";
shared Customer_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "558b72f4-f4fb-4d9d-8e76-b69b0cfe0a20"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "d5147d7c-ea26-4571-be49-203c2bce4eb1"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Customer2", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
