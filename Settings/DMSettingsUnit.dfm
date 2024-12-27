object DMSettings: TDMSettings
  Height = 554
  Width = 555
  object Rocks: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = RocksAfterPost
    Parameters = <>
    SQL.Strings = (
      'select * from Rocks'
      'order by Description')
    Left = 32
    Top = 440
  end
  object dsRocks: TDataSource
    DataSet = Rocks
    Left = 88
    Top = 440
  end
  object AssayGroups: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = AssayGroupsAfterPost
    Parameters = <>
    SQL.Strings = (
      'select * from AssayGroups order by N')
    Left = 32
    Top = 32
  end
  object dsAssayGroups: TDataSource
    DataSet = AssayGroups
    Left = 88
    Top = 32
  end
  object AssayVars: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = AssayVarsAfterPost
    DataSource = dsAssayGroups
    Parameters = <
      item
        Name = 'GroupId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from AssayVars where GroupId = :GroupId order by N')
    Left = 32
    Top = 96
  end
  object dsAssayVars: TDataSource
    DataSet = AssayVars
    Left = 88
    Top = 96
  end
  object CondDefs: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = CondDefsAfterPost
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM dbo.CondDefs')
    Left = 32
    Top = 326
  end
  object dsCondDefs: TDataSource
    DataSet = CondDefs
    Left = 88
    Top = 326
  end
  object Versions: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = VersionsAfterPost
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Id AS VersionId, VersionName, Description FROM dbo.Versio' +
        'ns ORDER BY VersionName')
    Left = 32
    Top = 384
  end
  object dsVersions: TDataSource
    DataSet = Versions
    Left = 88
    Top = 384
  end
  object BoundRefs: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterInsert = BoundRefsAfterInsert
    AfterPost = BoundRefsAfterPost
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM RefTable where Section = '#39'boundary2'#39)
    Left = 376
    Top = 32
  end
  object dsBoundRefs: TDataSource
    DataSet = BoundRefs
    Left = 472
    Top = 32
  end
  object BoundDetail: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = BoundDetailAfterPost
    Parameters = <>
    SQL.Strings = (
      'SELECT DictionaryId as Id,'
      '       Description as Name,'
      '       FullDesc as FullName'
      'FROM Dictionary WHERE Section = '#39'Boundary Detail'#39' ORDER BY N')
    Left = 376
    Top = 88
  end
  object dsBoundDetail: TDataSource
    DataSet = BoundDetail
    Left = 472
    Top = 88
  end
  object BoundSummary: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = BoundSummaryAfterPost
    Parameters = <>
    SQL.Strings = (
      'SELECT DictionaryId as Id,'
      '       Description as Name,'
      '       FullDesc as FullName'
      'FROM Dictionary WHERE Section = '#39'Boundary summary'#39' ORDER BY N')
    Left = 376
    Top = 162
  end
  object dsBoundSummary: TDataSource
    DataSet = BoundSummary
    Left = 472
    Top = 162
  end
  object dsBoundaries: TDataSource
    DataSet = Boundaries
    Left = 470
    Top = 296
  end
  object Dictionary: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterInsert = DictionaryAfterInsert
    AfterPost = DictionaryAfterPost
    Parameters = <
      item
        Name = 'Section'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = 'Boundary Detail'
      end>
    SQL.Strings = (
      'SELECT * FROM Dictionary'
      'WHERE Section = :Section'
      'ORDER BY N')
    Left = 200
    Top = 88
  end
  object dsDictionary: TDataSource
    DataSet = Dictionary
    Left = 262
    Top = 88
  end
  object BoundTypes: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select'#9#9'DictionaryId as DictId,'
      '      Section,'
      #9#9#9'N,'
      #9#9#9'FullDesc as BoundType,'
      #9#9#9'Description as BoundName'
      'from'#9#9'Dictionary d'
      
        'where'#9#9'Section = '#39#1089#1091#1084#1084#1072#1088#1085#1099#1077' '#1075#1088#1072#1085#1080#1094#1099#39' or Section = '#39#1076#1077#1090#1072#1083#1100#1085#1099#1077' '#1075#1088#1072 +
        #1085#1080#1094#1099#39
      'order by N')
    Left = 376
    Top = 232
  end
  object dsBoundTypes: TDataSource
    DataSet = BoundTypes
    Left = 470
    Top = 232
  end
  object AssayVarsCR: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = AssayVarsAfterPost
    DataSource = dsCoalTypes
    Parameters = <
      item
        Name = 'CoalGradeId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 410
      end
      item
        Name = 'CoalTypeId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 6
      end>
    SQL.Strings = (
      'select'#9#9'VarId,'
      '          N,'
      '          CoalRankId,'
      '          CoalTypeId'
      'from'#9#9'AssayVarsCR avcr'
      'where CoalRankId = :CoalGradeId and CoalTypeId = :CoalTypeId')
    Left = 32
    Top = 264
  end
  object dsAssayVarsCR: TDataSource
    DataSet = AssayVarsCR
    Left = 88
    Top = 264
  end
  object AssayVars1: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = AssayVarsAfterPost
    DataSource = dsAssayGroups1
    Parameters = <
      item
        Name = 'GroupId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from AssayVars'
      'where GroupId = :GroupId and Composite = 1'
      'order by N')
    Left = 32
    Top = 216
  end
  object dsAssayVars1: TDataSource
    DataSet = AssayVars1
    Left = 88
    Top = 216
  end
  object AssayGroups1: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = AssayGroupsAfterPost
    Parameters = <>
    SQL.Strings = (
      'select * from AssayGroups order by N')
    Left = 32
    Top = 168
  end
  object dsAssayGroups1: TDataSource
    DataSet = AssayGroups1
    Left = 88
    Top = 168
  end
  object CoalGrades: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select    DictionaryId as CoalGradeId, N,'
      '          Description as CoalGradeName, Fulldesc'
      'from      Dictionary d'
      'where     section = '#39#1084#1072#1088#1082#1072#39
      'order by  N')
    Left = 184
    Top = 200
  end
  object dsCoalGrades: TDataSource
    DataSet = CoalGrades
    Left = 256
    Top = 200
  end
  object CoalTypes: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    DataSource = dsCoalGrades
    Parameters = <
      item
        Name = 'CoalGradeId'
        DataType = ftInteger
        Value = 410
      end>
    SQL.Strings = (
      'select    DictionaryId as CoalTypeId, N,'
      '          Description as CoaltypeName, FullDesc,'
      '         :CoalGradeId as CoalGradeId'
      'from      Dictionary d'
      'where     Section = '#39#1090#1080#1087' '#1091#1075#1083#1103#39
      'order by  N  desc')
    Left = 184
    Top = 256
  end
  object dsCoalTypes: TDataSource
    DataSet = CoalTypes
    Left = 256
    Top = 256
  end
  object RockGroups: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = RocksAfterPost
    Parameters = <>
    SQL.Strings = (
      'select * from RockGroups'
      'order by RockGroupId')
    Left = 160
    Top = 440
  end
  object dsRockGroups: TDataSource
    DataSet = RockGroups
    Left = 224
    Top = 440
  end
  object Boundaries: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterInsert = BoundariesAfterInsert
    AfterPost = BoundariesAfterPost
    AfterDelete = BoundariesAfterDelete
    Parameters = <
      item
        Name = 'BoundType'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'SELECT    DictionaryId as Id,'
      '          N,'
      '          Description as Name,'
      '          FullDesc As FullName,'
      '          Section,'
      '          Actual'
      'FROM      Dictionary'
      'WHERE     Section = :BoundType'
      'ORDER BY  N')
    Left = 376
    Top = 296
  end
  object ResParams: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = RocksAfterPost
    Parameters = <>
    SQL.Strings = (
      'select * from ResParams')
    Left = 376
    Top = 368
  end
  object dsResParams: TDataSource
    DataSet = ResParams
    Left = 472
    Top = 368
  end
end
