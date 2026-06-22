[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Customer_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared Customer = let
  Source = Sql.Database("fabricserver1.database.windows.net", "FabricB"),
  #"Navigation 1" = Source{[Schema = "dbo", Item = "Customer"]}[Data],
  #"Inserted conditional column" = Table.AddColumn(#"Navigation 1", "Custom", each if [Region] = "North" then 1 else 0),
  #"Changed column type" = Table.TransformColumnTypes(#"Inserted conditional column", {{"Custom", Int64.Type}})
in
  #"Changed column type";
shared Customer_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "558b72f4-f4fb-4d9d-8e76-b69b0cfe0a20"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "f121b162-7e42-4150-9319-49029b7f13e9"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Customer", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
