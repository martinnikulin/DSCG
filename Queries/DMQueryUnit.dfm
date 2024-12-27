object DMQuery: TDMQuery
  Height = 321
  Width = 525
  object Queries: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Queries')
    Left = 24
    Top = 16
  end
  object QueryParams: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    DataSource = dsQueries
    Parameters = <
      item
        Name = 'QueryId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 7
      end>
    SQL.Strings = (
      'select * from QueryParams where QueryId = :QueryId'
      ''
      '')
    Left = 24
    Top = 81
  end
  object dsQueries: TDataSource
    DataSet = Queries
    Left = 112
    Top = 16
  end
  object dsQueryParams: TDataSource
    DataSet = QueryParams
    Left = 112
    Top = 81
  end
  object ADOQuery: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'LineId'
        Attributes = [paNullable]
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'SeamId'
        Attributes = [paNullable]
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'err'
        DataType = ftString
        Size = 1
        Value = '1'
      end>
    SQL.Strings = (
      
        'SELECT DISTINCT *  FROM'#9'f_Error_Basic(:LineId, :SeamId, :err) AS' +
        ' F ORDER BY'#9'['#1050#1086#1076' '#1088'.'#1083'.], ['#1050#1086#1076' '#1087#1083#1072#1089#1090#1072'], ['#1050#1086#1076' '#1089#1082#1074#1072#1078#1080#1085#1099'], ['#1044#1086']')
    Left = 24
    Top = 161
  end
  object dsADOQuery: TDataSource
    DataSet = ADOQuery
    Left = 112
    Top = 161
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
    Left = 248
    Top = 16
  end
  object dsInterbeds: TDataSource
    DataSet = Interbeds
    Left = 320
    Top = 16
  end
  object Seams: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select    SeamId as SeamId,'
      '          Description as SeamName'
      'from      Seams'
      'order by  SeamName')
    Left = 248
    Top = 80
  end
  object dsSeams: TDataSource
    DataSet = Seams
    Left = 320
    Top = 80
  end
  object AssayGroups: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select GroupId as GroupId, GroupName  from AssayGroups order by ' +
        'N')
    Left = 246
    Top = 160
  end
  object dsAssayGroups: TDataSource
    DataSet = AssayGroups
    Left = 320
    Top = 160
  end
  object WorkTypes: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select N as Id, [Description] as [Name] from Dictionary where Se' +
        'ction = '#39#1089#1087#1086#1089#1086#1073' '#1086#1090#1088#1072#1073#1086#1090#1082#1080#39)
    Left = 245
    Top = 208
  end
  object dsWorkTypes: TDataSource
    DataSet = WorkTypes
    Left = 325
    Top = 208
  end
  object IntervalTypes: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select N as Id, [Description] as [Name] from Dictionary where Se' +
        'ction = '#39#1090#1080#1087' '#1080#1085#1090#1077#1088#1074#1072#1083#1100#1085#1099#1093' '#1079#1072#1087#1072#1089#1086#1074#39)
    Left = 245
    Top = 256
  end
  object dsIntervalTypes: TDataSource
    DataSet = IntervalTypes
    Left = 325
    Top = 257
  end
end
