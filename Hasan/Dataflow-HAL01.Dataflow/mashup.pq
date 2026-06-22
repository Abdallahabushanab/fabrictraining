[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Customer_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "CustomerID", DestinationColumnName = "CustomerID"], [SourceColumnName = "CustomerName", DestinationColumnName = "CustomerName"], [SourceColumnName = "Region", DestinationColumnName = "Region"], [SourceColumnName = "Fabric2", DestinationColumnName = "Fabric"]}], DynamicSchema = false, UpdateMethod = [Kind = "Append"], TypeSettings = [Kind = "Table"]]]}]
shared Customer = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "558b72f4-f4fb-4d9d-8e76-b69b0cfe0a20"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "93353530-b58d-49e9-98fa-fd6d407885c0"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "Customer", ItemKind = "Table"]}[Data],
  #"Added custom" = Table.TransformColumnTypes(Table.AddColumn(#"Navigation 2", "Fabric2", each "Fabric2"), {{"Fabric2", type text}})
in
  #"Added custom";
shared Customer_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "558b72f4-f4fb-4d9d-8e76-b69b0cfe0a20"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "93353530-b58d-49e9-98fa-fd6d407885c0"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Customer", ItemKind = "Table"]}[Data]
in
  TableNavigation;
