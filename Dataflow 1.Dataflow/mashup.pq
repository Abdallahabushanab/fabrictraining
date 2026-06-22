[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Documents_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared Documents = let
  Source = Folder.Files("C:\Users\Administrator\Documents"),
  Navigation = Source{[#"Folder Path" = "C:\Users\Administrator\Documents\", Name = "Sales.xlsx"]}[Content],
  #"Imported Excel workbook" = Excel.Workbook(Navigation, null, true),
  #"Navigation 1" = #"Imported Excel workbook"{[Item = "Sheet1", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"SaleID", Int64.Type}, {"Product", type text}, {"Amount", Int64.Type}}),
  #"Added custom" = Table.AddColumn(#"Changed column type", "Fabric", each "Fabric"),
  #"Changed column type 1" = Table.TransformColumnTypes(#"Added custom", {{"Fabric", type text}})
in
  #"Changed column type 1";
shared Documents_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "558b72f4-f4fb-4d9d-8e76-b69b0cfe0a20"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "c5954c0b-eea7-4dda-9baf-d4999aafe124"]}[Data],
  Navigation_3 = Navigation_2{[Id = "Sales", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "sales2", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
