object DMReserves: TDMReserves
  Height = 387
  Width = 531
  object Seams: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select    SeamId,'
      '          Description as SeamName,'
      '          ShortName'
      'from      Seams'
      'where Actual = 1'
      'order by  SeamName')
    Left = 24
    Top = 16
  end
  object dsSeams: TDataSource
    DataSet = Seams
    Left = 88
    Top = 16
  end
  object HoleSeams: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = HoleSeamsAfterPost
    DataSource = dsSeams
    Parameters = <
      item
        Name = 'SeamId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end
      item
        Name = 'InterbedId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 100
      end>
    SQL.Strings = (
      'SELECT      hs.HoleSeamId,'
      #9#9#9'      hs.AdCoal,'
      #9#9#9'      hs.AdFull,'
      #9#9#9'      hs.ThCoal,'
      #9#9#9'      hs.ThFull,'
      #9#9#9'      hs.AdR,'
      #9#9#9'      hs.ThR,'
      '            hs.AvgCalc as AvgCalc,'
      '            hs.Comments,'
      '            hs.Lock,'
      '            hs.HoleSeamId as id,'
      '            hs.BoreholeId,'
      '            hs.SeamId,'
      '            Boreholes.HoleName,'
      '            hs.DepthFrom,'
      '            hs.DepthTo,'
      '            hs.CoalType,'
      '            hs.CoalGrade,'
      '            hs.KB,'
      '            hs.InterbedId,'
      '            hs.OnMap,'
      '            hs.Stat,'
      '            hs.Comments as hs_comments'
      'FROM        HoleSeams hs'
      'INNER JOIN  Boreholes ON'
      '            hs.BoreholeId = Boreholes.BoreholeId'
      'WHERE      (hs.SeamId = :SeamId) and'
      '           (hs.InterbedId = :InterbedId)'
      'ORDER BY    hs.BoreholeId, hs.DepthTo')
    Left = 24
    Top = 80
  end
  object dsHoleSeams: TDataSource
    DataSet = HoleSeams
    Left = 88
    Top = 80
  end
  object Lithology: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = LithologyAfterPost
    DataSource = dsHoleSeams
    Parameters = <
      item
        Name = 'BoreholeId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 4
      end
      item
        Name = 'DepthFrom'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 2
        Precision = 18
        Size = 2
        Value = 1052000c
      end
      item
        Name = 'DepthTo'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 2
        Precision = 18
        Size = 2
        Value = 1061500c
      end
      item
        Name = 'InterbedId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 100
      end>
    SQL.Strings = (
      
        'SELECT      lr.LithologyId, l.BoreholeId, l.DepthFrom, l.DepthTo' +
        ', l.ThNorm, l.Core, l.Th,'
      
        '            l.RockId,  lr.Reserves, l.Angle, l.CoreNorm, l.CoreP' +
        'roc'
      'FROM        Lithology l'
      'INNER JOIN  LithRes lr ON l.LithologyId = lr.LithologyId'
      
        'WHERE       (BoreholeId = :BoreholeId) and (DepthFrom >= :DepthF' +
        'rom) and (DepthTo <= :DepthTo) and (InterbedId = :InterbedId)'
      'ORDER BY    DepthTo')
    Left = 24
    Top = 139
  end
  object dsLithology: TDataSource
    DataSet = Lithology
    Left = 88
    Top = 139
  end
  object Samples: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = SamplesAfterPost
    DataSource = dsHoleSeams
    Parameters = <
      item
        Name = 'HoleSeamId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 260
      end>
    SQL.Strings = (
      
        'select * from SeamSamples where HoleSeamId = :HoleSeamId order b' +
        'y DepthTo')
    Left = 23
    Top = 203
  end
  object dsSamples: TDataSource
    DataSet = Samples
    Left = 87
    Top = 203
  end
  object SeamConds: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = SeamCondsAfterPost
    DataSource = dsSeams
    Parameters = <
      item
        Name = 'SeamId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end
      item
        Name = 'InterbedId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 100
      end>
    SQL.Strings = (
      'SELECT      SC.SeamId,'
      '            SC.ConditionId,'
      '            SC.RealCondId,'
      '            C1.InterbedId AS InterbedId,'
      '            C2.Variant AS N,'
      #9#9#9'C2.IbCond,'
      
        #9#9#9'case when st.ParamValue = '#39'1'#39' then C2.ThCond else C2.ThCondSu' +
        'm end as ThCond,'
      
        #9#9#9'case when st.ParamValue = '#39'1'#39' then C2.AshCond else C2.AshCond' +
        'Sum end as AshCond'
      'FROM        dbo.SeamConds SC'
      'INNER JOIN'#9'dbo.Condition C1 ON'
      #9#9#9'C1.Id = SC.RealCondId'
      'INNER JOIN'#9'dbo.Condition AS C2 ON'
      #9#9#9'SC.ConditionId = C2.Id'
      'cross join'#9'Settings st'
      'WHERE'#9#9'SC.SeamId = :SeamId'
      #9#9#9'AND C2.InterbedId = :InterbedId and'
      #9#9#9'st.Section = '#39'Database'#39' and st.ParamName = '#39'GDBType'#39
      'ORDER BY'#9'N')
    Left = 191
    Top = 16
  end
  object dsSeamConds: TDataSource
    DataSet = SeamConds
    Left = 263
    Top = 16
  end
  object Averages: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = AveragesAfterPost
    DataSource = dsSeamConds
    Parameters = <
      item
        Name = 'SeamId'
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
        Value = Null
      end>
    SQL.Strings = (
      'select  SeamId,'
      '        InterbedId,'
      '        CoalType,'
      '        CoalGrade,'
      '        VarId,'
      '        [Value],'
      '        UserValue'
      'from    Averages a'
      'where (SeamId = :SeamId) and (InterbedId = :InterbedId)'
      'order by a.CoalType, a.CoalGrade')
    Left = 191
    Top = 83
  end
  object dsAverages: TDataSource
    DataSet = Averages
    Left = 263
    Top = 83
  end
  object dsAvgRefs: TDataSource
    DataSet = AvgRefs
    Left = 263
    Top = 139
  end
  object AvgRefs: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    DataSource = dsSeamConds
    Parameters = <>
    SQL.Strings = (
      'select * from AvgRefs')
    Left = 191
    Top = 139
  end
  object Blocks: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterInsert = BlocksAfterInsert
    AfterPost = BlocksAfterPost
    DataSource = dsParts
    EnableBCD = False
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
        Name = 'ConditionId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'VersionId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end>
    SQL.Strings = (
      'SELECT  BlockId,'
      '        ConditionId,'
      '        VersionId,'
      '        BlockName,'
      '        Category,'
      '        CoalType,'
      '        Dip,'
      '        PartId,'
      '        Balance,'
      '        AdCoal,'
      '        AdFull,'
      '        ThCoal,'
      '        ThFull,'
      '        AdC,'
      '        AdF,'
      '        ThC,'
      '        ThF,'
      '        Comments,'
      '        AvgCalc,'
      '        Lock'
      'FROM    Blocks'
      
        'WHERE (PartId = :PartId) and (ConditionId = :ConditionId) and (V' +
        'ersionId = :VersionId)')
    Left = 388
    Top = 144
  end
  object dsBlocks: TDataSource
    DataSet = Blocks
    Left = 460
    Top = 144
  end
  object Parts: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    DataSource = dsSeamConds
    Parameters = <
      item
        Name = 'RealCondId'
        DataType = ftInteger
        Value = 111
      end
      item
        Name = 'SeamId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    SQL.Strings = (
      'select    Parts.*, :RealCondId as ConditionId'
      'from      Parts'
      'where     (SeamId = :SeamId)'
      'order by N')
    Left = 388
    Top = 88
  end
  object dsParts: TDataSource
    DataSet = Parts
    Left = 460
    Top = 88
  end
  object BlockDetails: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterInsert = BlockDetailsAfterInsert
    AfterPost = BlockDetailsAfterPost
    DataSource = dsBlocks
    Parameters = <
      item
        Name = 'BlockId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 65
      end
      item
        Name = 'ConditionId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'VersionId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end>
    SQL.Strings = (
      
        'select    Id, BlockId, Boundary, Pillar, CoalGrade, Z, Attr, Are' +
        'a, ResCoal, ResFull, ConditionId, VersionId'
      'from      BlockDetails bd'
      'where     BlockId = :BlockId and'
      '          ConditionId = :ConditionId and'
      '          VersionId = :VersionId'
      '')
    Left = 388
    Top = 200
  end
  object dsBlockdetails: TDataSource
    DataSet = BlockDetails
    Left = 460
    Top = 200
  end
  object BlockUnits: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = BlockUnitsAfterPost
    BeforeDelete = BlockUnitsBeforeDelete
    DataSource = dsBlocks
    Parameters = <
      item
        Name = 'BlockId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 65
      end
      item
        Name = 'ConditionId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'VersionId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end>
    SQL.Strings = (
      'select     bu.Id,'
      '           hs.HoleSeamId,'
      '           bu.BlockId,'
      '           bu.ConditionId,'
      '           bu.VersionId,'
      '           bu.HoleName,'
      '           hs.DepthFrom,'
      '           hs.DepthTo,'
      '           bu.AdCoal,'
      '           bu.AdFull,'
      '           bu.ThCoal,'
      '           bu.ThFull,'
      '           hs.AvgCalc as AvgCalc,'
      '           bu.AdR,'
      '           bu.ThR'
      'from       BlockUnits bu'
      'left join HoleSeams hs on hs.HoleSeamId = bu.HoleSeamId'
      'left join Boreholes h on h.BoreholeId = hs.BoreholeId'
      'where     BlockId = :BlockId and'
      '          ConditionId = :ConditionId and'
      '          VersionId = :VersionId'
      '')
    Left = 388
    Top = 258
  end
  object dsBlockUnits: TDataSource
    DataSet = BlockUnits
    Left = 460
    Top = 258
  end
  object Versions: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Id, VersionName, Description FROM dbo.Versions ORDER BY V' +
        'ersionName')
    Left = 388
    Top = 18
  end
  object dsVersions: TDataSource
    DataSet = Versions
    Left = 452
    Top = 18
  end
  object Query: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    DataSource = dsSeamConds
    Parameters = <
      item
        Name = 'RealCondId'
        DataType = ftInteger
        Value = 111
      end
      item
        Name = 'SeamId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    SQL.Strings = (
      'select    Parts.*, :RealCondId as ConditionId'
      'from      Parts'
      'where     (SeamId = :SeamId)'
      'order by N')
    Left = 20
    Top = 272
  end
  object dsQuery: TDataSource
    DataSet = Query
    Left = 92
    Top = 272
  end
  object Composites: TADOQuery
    AutoCalcFields = False
    Connection = DM.GDBConnection
    CursorType = ctStatic
    DataSource = dsHoleSeams
    Parameters = <
      item
        Name = 'HoleseamId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select'#9#9'[Description] as VarName, [Value]'
      'from'#9#9'Composites c'
      'inner join'#9'AssayVars av on c.VarId = av.VarId'
      'where HoleseamId = :HoleseamId'
      ''
      '')
    Left = 191
    Top = 211
  end
  object dsComposites: TDataSource
    DataSet = Composites
    Left = 263
    Top = 211
  end
  object Variants: TADOQuery
    AutoCalcFields = False
    Connection = DM.GDBConnection
    CursorType = ctStatic
    DataSource = dsSeamConds
    Parameters = <
      item
        Name = 'ConditionId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 111
      end
      item
        Name = 'InterbedId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 100
      end>
    SQL.Strings = (
      'select'#9#9'ConditionId,'
      '      ConditionId/100*100 as InterbedId,'
      #9#9#9'NVariant as N,'
      #9#9#9'Convert(nvarchar(5), NVariant) as Variant,'
      #9#9#9#39#1042#1072#1088#1080#1072#1085#1090' '#39' + Convert(nvarchar(5), NVariant) as VariantName'
      'from'#9#9'Variants'
      'where'#9#9'ConditionId <> :ConditionId'
      'union'
      'select'#9#9'N * 100 as ConditionId,'
      '      N * 100 as InterbedId,'
      #9#9#9'N - 10 as N,'
      #9#9#9#39#39' as Variant,'
      #9#9#9#39#1055#1088#1086#1089#1083#1086#1081' '#39' + CondName as VariantName'
      'from'#9#9'CondDefs'
      'where'#9#9'Section = '#39#1055#1088#1086#1089#1083#1086#1081#39' and'
      #9#9#9'N * 100 <> :InterbedId'
      'order by'#9'N')
    Left = 191
    Top = 283
  end
  object dsVariants: TDataSource
    DataSet = Variants
    Left = 263
    Top = 283
  end
end
