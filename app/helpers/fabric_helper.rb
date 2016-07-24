module FabricHelper
  def self.date_ranges
    ["Before 700",
    "700-725",
    "726-750",
    "751-775",
    "776-799",
    "800-825",
    "826-850",
    "851-875",
    "876-899",
    "900-925",
    "926-950",
    "950-975",
    "976-999",
    "1000-1025",
    "1026-1050",
    "1051-1075",
    "1076-1099",
    "1100-1125",
    "1126-1150",
    "1151-1175",
    "1176-1199",
    "1200-1225",
    "1226-1250",
    "1251-1275",
    "1276-1299",
    "1300-1325",
    "1326-1350",
    "1351-1375",
    "1376-1399",
    "1400-1425",
    "1426-1450",
    "1451-1475",
    "1476-1499",
    "1500-1525",
    "1526-1550",
    "1551-1575",
    "1576-1599",
    "Post 1600"]
  end
  
  def self.build_information_part1(fabric)
    fabric.build_nave
    fabric.towers.build
    fabric.doors.build
    fabric.build_porch
  end
  
  def self.build_information_part2(fabric)
    fabric.build_chancel
    fabric.build_altar
    fabric.chantry_chapels.build
    fabric.build_sedilia
    fabric.build_piscina
  end
end
