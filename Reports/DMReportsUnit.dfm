object DMReports: TDMReports
  Height = 246
  Width = 391
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
      'SELECT    :RealCondId as ConditionId, p.*'
      'FROM      Parts p'
      'WHERE     SeamId = :SeamId'
      'ORDER BY  N')
    Left = 102
    Top = 20
  end
  object BlockUnits: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    DataSource = dsBlocks
    Parameters = <
      item
        Name = 'BlockId'
        Attributes = [paNullable]
        DataType = ftInteger
        Value = 931
      end
      item
        Name = 'ConditionId'
        DataType = ftInteger
        Value = 111
      end
      item
        Name = 'VersionId'
        DataType = ftInteger
        Value = 1
      end>
    SQL.Strings = (
      'select * from fResBlockunit(:BlockId, :ConditionId, :VersionId)'
      'ORDER BY N, BoreholeId'
      ''
      ''
      ''
      '')
    Left = 230
    Top = 20
  end
  object Blocks: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    DataSource = dsParts
    Parameters = <
      item
        Name = 'PartId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end
      item
        Name = 'ConditionId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 111
      end>
    SQL.Strings = (
      'select * from fResBlock(:PartId, :ConditionId, 1)'
      
        'ORDER BY ISNUMERIC(BlockName), ltrim(right('#39'000000'#39' + rtrim(Bloc' +
        'kName), 5))')
    Left = 166
    Top = 20
  end
  object SeamConds: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ConditionId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 111
      end
      item
        Name = 'SeamId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end
      item
        Name = 'allseams'
        DataType = ftWideString
        Size = 1
        Value = '1'
      end>
    SQL.Strings = (
      'with q1 as ('
      'SELECT      distinct'
      '            SC.ConditionId,'
      '            S.N,'
      '            C.IbCond,'
      '            C.ThCond,'
      '            C.AshCond,'
      '            SC.RealCondId,'
      '            S.SeamId,'
      '            S.[Description] AS seamname,'
      '            S.Strata'
      'FROM        dbo.SeamConds SC'
      'INNER JOIN'#9'dbo.Seams S ON'
      '            SC.SeamId = S.SeamId'
      'inner join'#9'Parts p on s.SeamId = p.SeamId'
      'inner join'#9'Blocks B on B.PartId = p.PartId'
      'INNER JOIN'#9'dbo.Condition C ON'
      '            SC.ConditionId = C.Id'
      'WHERE'#9#9'    (S.Actual = 1) and'
      '            (C.Id = :ConditionId) and'
      '            ((S.SeamId = :SeamId) or (:allseams = 1))'
      ')'
      'select      *'
      'from        q1'
      'ORDER BY'#9'  N')
    Left = 32
    Top = 18
  end
  object dsSeamConds: TDataSource
    AutoEdit = False
    DataSet = SeamConds
    Left = 32
    Top = 72
  end
  object dsParts: TDataSource
    DataSet = Parts
    Left = 104
    Top = 72
  end
  object dsBlocks: TDataSource
    DataSet = Blocks
    Left = 168
    Top = 72
  end
  object BlockCount: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    DataSource = dsSeamConds
    Parameters = <
      item
        Name = 'SeamId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end
      item
        Name = 'RealCondId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 111
      end>
    SQL.Strings = (
      'select'#9#9'B.BlockId'
      'from'#9#9'Parts p'
      'inner join'#9'Blocks B on B.PartId = p.PartId'
      'where'#9#9'p.SeamId = :SeamId and'
      '        B.ConditionId = :RealCondId')
    Left = 230
    Top = 76
  end
  object AssayGroups: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from AssayGroups order by N')
    Left = 32
    Top = 128
  end
  object dsAssayGroups: TDataSource
    DataSet = AssayGroups
    Left = 104
    Top = 128
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
    Left = 166
    Top = 130
  end
  object dsInterbeds: TDataSource
    DataSet = Interbeds
    Left = 230
    Top = 130
  end
  object Samples: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'InterbedId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 100
      end
      item
        Name = 'GroupId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end>
    SQL.Strings = (
      'select * from dbo.fSamplesTable(:InterbedId, :GroupId)'
      
        'order by NSeam, NLine, NBorehole, HoleName asc, DepthTo asc, Dep' +
        'thFrom desc')
    Left = 32
    Top = 186
  end
  object Assays: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    DataSource = dsSamples
    Parameters = <
      item
        Name = 'SampleId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 3929
      end
      item
        Name = 'GroupID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select'#9#9'A.SampleId,'
      #9#9#9'A.Val,'
      #9#9#9'right('#39'0'#39' + cast(ag.N as nvarchar(5)), 2) + '#39'.'#39' +'
      #9#9#9'right('#39'0'#39' + cast(av.N as nvarchar(5)), 2) as excelcode'
      'from Assays as A'
      'inner join AssayVars as av on A.VarId = av.VarId'
      'inner join AssayGroups as ag on ag.GroupId = av.GroupId'
      
        'where A.SampleId = :SampleId and av.Actual = 1 and ag.GroupId = ' +
        ':GroupID'
      'order by SampleId, ag.N, av.N')
    Left = 168
    Top = 186
  end
  object dsSamples: TDataSource
    DataSet = Samples
    Left = 104
    Top = 184
  end
end
