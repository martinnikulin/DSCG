object DMGeoms: TDMGeoms
  Height = 346
  Width = 439
  object PlanGeoms: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    DataSource = dsParts
    Parameters = <
      item
        Name = 'PartId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'InterbedId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 100
      end
      item
        Name = 'Vertical1'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'Vertical2'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'PartId1'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end
      item
        Name = 'InterbedId1'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 100
      end>
    SQL.Strings = (
      
        'select    FeatureName, FeatureType, Geom.STAsText() as GeomText,' +
        ' pg.PartId'
      'from      PlanGeoms pg'
      'inner join Parts p on p.PartId = pg.PartId'
      'where     p.PartId = :PartId'
      '          and pg.InterbedId = :InterbedId'
      
        '          and (:Vertical1 = 0 and not (p.Vertical = 1 and Featur' +
        'eType < 5) or :Vertical2 = 1 and (p.Vertical = 1 and FeatureType' +
        ' < 5))'
      '          and FeatureType < 7'
      'union'
      
        'select'#9#9'BlockName as FeatureName, 7 as FeatureType, Geom.STAsTex' +
        't() as GeomText, PartId'
      'from'#9#9'Blocks b'
      
        'where'#9#9'not Geom is null and PartId = :PartId1 and ConditionId/10' +
        '0*100 = :InterbedId1'
      'order by  FeatureType')
    Left = 32
    Top = 152
  end
  object dsPlanGeoms: TDataSource
    DataSet = PlanGeoms
    Left = 96
    Top = 152
  end
  object Seams: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select    SeamId, Description'
      'from      Seams'
      'where     Actual = 1'
      'order by  N')
    Left = 32
    Top = 24
  end
  object dsSeams: TDataSource
    DataSet = Seams
    Left = 96
    Top = 24
  end
  object Parts: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    DataSource = dsSeams
    Parameters = <
      item
        Name = 'SeamId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end>
    SQL.Strings = (
      'select    PartId, PartId as PartId1,'
      '          '#39#1044#1077#1090#1072#1083#1100' '#8470#39' + NPart as NPart,'
      '          Vertical'
      'from      Parts'
      'where     SeamId = :SeamId')
    Left = 32
    Top = 80
  end
  object dsParts: TDataSource
    DataSet = Parts
    Left = 96
    Top = 80
  end
  object Interbeds: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select    N * 100 as InterbedId,'
      '          '#39#1055#1088#1086#1089#1083#1086#1081' '#39' + CondName + '#39' '#1084'. '#39' as InterbedName'
      'from      dbo.CondDefs cd'
      'where     Section = '#39#1055#1088#1086#1089#1083#1086#1081#39
      'order by  N')
    Left = 192
    Top = 24
  end
  object dsInterbeds: TDataSource
    DataSet = Interbeds
    Left = 255
    Top = 24
  end
end
