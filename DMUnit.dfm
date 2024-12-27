object DM: TDM
  OnCreate = DataModuleCreate
  Height = 846
  Width = 876
  PixelsPerInch = 120
  object GDBConnection: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Password=DSCG;Persist Security Info=True;U' +
      'ser ID=DSCG;Initial Catalog=GDB520007;Data Source=176.196.195.24' +
      '2;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=40' +
      '96;Workstation ID=DESKTOP-TVT25EU;Initial File Name="";Use Encry' +
      'ption for Data=False;Tag with column collation when possible=Fal' +
      'se;MARS Connection=False;DataTypeCompatibility=0;Trust Server Ce' +
      'rtificate=False;Server SPN="";Application Intent=READWRITE;Multi' +
      'SubnetFailover=False;Use FMTONLY=False;Authentication="";Access ' +
      'Token="";TransparentNetworkIPResolution=True;Connect Retry Count' +
      '=1;Connect Retry Interval=10'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'MSOLEDBSQL.1'
    Left = 50
    Top = 210
  end
  object DeletePart: TADOStoredProc
    Connection = GDBConnection
    ProcedureName = 'DeletePart;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@PartId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ConditionId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 140
    Top = 751
  end
  object CopyIBChecks: TADOStoredProc
    Connection = GDBConnection
    ProcedureName = 'CopyIBChecks;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@SeamId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@condition_from'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@condition_to'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 40
    Top = 750
  end
  object Interbeds: TADOQuery
    Connection = GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select    N * 100 as InterbedId,'
      '          '#39#1055#1088#1086#1089#1083#1086#1081' '#39' + CondName + '#39' '#1084'. '#39' as InterbedName'
      'from      dbo.CondDefs cd'
      'where     Section = '#39#1055#1088#1086#1089#1083#1086#1081#39
      'order by  N')
    Left = 470
    Top = 390
  end
  object dsInterbeds: TDataSource
    DataSet = Interbeds
    Left = 560
    Top = 390
  end
  object HoleTypes: TADOQuery
    Connection = GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select    DictionaryId as Id,'
      '          Description as HoleTypeName'
      'from      Dictionary d'
      'where     Section = '#39'HoleType'#39
      'order by  N')
    Left = 50
    Top = 380
  end
  object dsHoleTypes: TDataSource
    DataSet = HoleTypes
    Left = 140
    Top = 380
  end
  object LineTypes: TADOQuery
    Connection = GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select    DictionaryId as Id,'
      '          Description as SLTypeName'
      'from      Dictionary d'
      'where     Section = '#39'sltype'#39
      'order by  N')
    Left = 50
    Top = 450
  end
  object dsLineTypes: TDataSource
    DataSet = LineTypes
    Left = 140
    Top = 450
  end
  object CoalTypes: TADOQuery
    Connection = GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select    DictionaryId as Id,'
      '          Description as CoaltypeName'
      'from      Dictionary d'
      'where     Section = '#39#1090#1080#1087' '#1091#1075#1083#1103#39' or Section = '#39#1086#1073#1097#1080#1081#39
      'order by  N')
    Left = 50
    Top = 520
  end
  object dsCoalTypes: TDataSource
    DataSet = CoalTypes
    Left = 140
    Top = 520
  end
  object CoalGrades: TADOQuery
    Connection = GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select    DictionaryId as Id,'
      '          Description as CoalGradeName'
      'from      Dictionary d'
      'where     Section = '#39#1084#1072#1088#1082#1072#39' or Section = '#39#1086#1073#1097#1080#1081#39
      'order by  N')
    Left = 50
    Top = 590
  end
  object dsCoalGrades: TDataSource
    DataSet = CoalGrades
    Left = 140
    Top = 590
  end
  object Seams: TADOQuery
    Connection = GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select    SeamId as SeamId,'
      '          Description as SeamName'
      'from      Seams'
      'order by  SeamName')
    Left = 470
    Top = 460
  end
  object dsSeams: TDataSource
    DataSet = Seams
    Left = 560
    Top = 460
  end
  object Rocks: TADOQuery
    Connection = GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select    RockId as RockId,'
      '          Description as RockName'
      'from      Rocks'
      'order by  RockName')
    Left = 470
    Top = 530
  end
  object dsRocks: TDataSource
    DataSet = Rocks
    Left = 560
    Top = 530
  end
  object Boundaries: TADOQuery
    Connection = GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select DictionaryId as Id, Description as BoundaryName, FullDesC' +
        ' from dictionary'
      'where (Section = '#39'Boundary Detail'#39') or (Section = '#39#1086#1073#1097#1080#1081#39')'
      '')
    Left = 251
    Top = 523
  end
  object dsBoundaries: TDataSource
    DataSet = Boundaries
    Left = 340
    Top = 520
  end
  object Pillars: TADOQuery
    Connection = GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'#9#9'DictionaryId as Id, [Description] as PillarName'
      'FROM'#9'    Dictionary D'
      'WHERE'#9#9'  D.Section = '#39'Pillar'#39)
    Left = 250
    Top = 593
  end
  object dsPillars: TDataSource
    DataSet = Pillars
    Left = 340
    Top = 590
  end
  object Attributes: TADOQuery
    Connection = GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select DictionaryId as Id, Description as AttrName from dictiona' +
        'ry'
      'where (Section = '#39'Attr1'#39') or (Section = '#39#1086#1073#1097#1080#1081#39')'
      ''
      '')
    Left = 250
    Top = 673
  end
  object dsAttributes: TDataSource
    DataSet = Attributes
    Left = 340
    Top = 670
  end
  object CoreGroups: TADOQuery
    Connection = GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'#9#9'RockGroupId as Id,'
      '          Description as CoreGroupName'
      'FROM'#9'    RockGroups'
      '')
    Left = 250
    Top = 383
  end
  object dsCoreGroups: TDataSource
    DataSet = CoreGroups
    Left = 340
    Top = 380
  end
  object Categories: TADOQuery
    Connection = GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select DictionaryId as Id, Description as CatName from Dictionar' +
        'y'
      'where Section = '#39#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1079#1072#1087#1072#1089#1086#1074#39)
    Left = 250
    Top = 450
  end
  object dsCategories: TDataSource
    DataSet = Categories
    Left = 340
    Top = 450
  end
  object ADOQuery: TADOQuery
    Connection = GDBConnection
    CursorType = ctStatic
    Parameters = <>
    Left = 340
    Top = 750
  end
  object dsADOQuery: TDataSource
    Left = 420
    Top = 750
  end
  object ADOCommand: TADOCommand
    Parameters = <>
    Left = 240
    Top = 750
  end
  object Formations: TADOQuery
    Connection = GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select DictionaryId as Id, Description as FormationName from dic' +
        'tionary'
      'where (Section = '#39#1089#1074#1080#1090#1072#39') or (Section = '#39#1086#1073#1097#1080#1081#39')'
      ''
      '')
    Left = 50
    Top = 666
  end
  object dsFormations: TDataSource
    DataSet = Formations
    Left = 140
    Top = 666
  end
  object AdTypes: TADOQuery
    Connection = GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select N as Id, Description as AdTypeName from dictionary'
      'where (Section = '#39'Ad'#39')'
      ''
      '')
    Left = 470
    Top = 596
  end
  object dsAdTypes: TDataSource
    DataSet = AdTypes
    Left = 560
    Top = 596
  end
  object Condition: TADOQuery
    Connection = GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select'#9#9'c.Id,'
      
        #9#9#9'CONVERT(NVARCHAR(3), Variant) + '#39':   '#39' + case when s.ParamVal' +
        'ue = 1 then Variant1 else Variant2 end as Variant,'
      
        #9#9#9'case when s.ParamValue = 1 then Variant1 else Variant2 end as' +
        ' CondName'
      'from'#9#9'Condition c'
      'cross join'#9'Settings s'
      'where'#9#9's.Section = '#39'Database'#39
      #9#9#9'and s.ParamName = '#39'GDBType'#39)
    Left = 463
    Top = 670
  end
  object dsCondition: TDataSource
    DataSet = Condition
    Left = 563
    Top = 670
  end
  object dsListOfTables: TDataSource
    DataSet = ListOfTables
    Left = 150
    Top = 290
  end
  object ListOfTables: TClientDataSet
    PersistDataPacket.Data = {
      980000009619E0BD010000001800000005000000000003000000980008566965
      774E616D650100490000000100055749445448020002001400095461626C654E
      616D650100490000000100055749445448020002001400075265717565727902
      000300000000000C517565727941646472657373080001000000000009517565
      72794E616D6501004900000001000557494454480200020014000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 50
    Top = 290
    object ListOfTablesViewName: TStringField
      FieldName = 'ViewName'
    end
    object ListOfTablesTableName: TStringField
      FieldName = 'TableName'
    end
    object ListOfTablesRequery: TBooleanField
      FieldName = 'Requery'
    end
    object ListOfTablesQueryAddress: TLargeintField
      FieldName = 'QueryAddress'
    end
    object ListOfTablesQueryName: TStringField
      FieldName = 'QueryName'
    end
  end
  object Settings: TADOQuery
    Connection = GDBConnection
    Parameters = <>
    SQL.Strings = (
      'select * from Settings')
    Left = 250
    Top = 290
  end
  object ExcelTable: TADOTable
    Connection = ExcelConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    TableDirect = True
    TableName = #1051#1080#1089#1090'1$'
    Left = 680
    Top = 750
  end
  object ExcelConnection: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 570
    Top = 750
  end
  object AssayVars: TADOQuery
    Connection = GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select    VarId,'
      '          Description as VarName'
      'from      AssayVars')
    Left = 670
    Top = 460
  end
  object dsAssayVars: TDataSource
    DataSet = AssayVars
    Left = 760
    Top = 460
  end
  object HomeCatConn: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Initial Catalog=DSCGSystem;Data Source=loc' +
      'alhost;Password=DSCG;Persist Security Info=True;User ID=DSCG;'
    ConnectionTimeout = 5
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 60
    Top = 20
  end
  object RemoteCatConn: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Initial Catalog=DSCGSystem;Data Source=loc' +
      'alhost;Password=DSCG;Persist Security Info=True;User ID=DSCG;'
    ConnectionTimeout = 5
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 60
    Top = 100
  end
  object Servers: TADOQuery
    Connection = HomeCatConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select    Id, ServerName, RemoteServer'
      'from      Servers'
      '')
    Left = 170
    Top = 20
  end
  object dsServers: TDataSource
    DataSet = Servers
    Left = 260
    Top = 20
  end
  object Projects: TADOQuery
    Connection = RemoteCatConn
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'select'#9#9'*'
      'from'#9#9'   Projects'
      'where'#9#9'   Actual = 1'
      '           and not [Database] = '#39'GDB50'#39
      'order by ProjectName')
    Left = 360
    Top = 100
  end
  object dsProjects: TDataSource
    DataSet = Projects
    Left = 450
    Top = 100
  end
  object dsUsers: TDataSource
    DataSet = Users
    Left = 260
    Top = 100
  end
  object Users: TADOQuery
    Connection = RemoteCatConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select UserId, UserName, RoleId, Password from Users order by Us' +
        'erName')
    Left = 170
    Top = 100
  end
  object PreviousProjects: TADOQuery
    Connection = RemoteCatConn
    CursorType = ctStatic
    DataSource = dsProject
    Parameters = <
      item
        Name = 'Id'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select    *'
      'from      PreviousProjects'
      'where     ProjectId = :Id'
      'order by  ProjectDate')
    Left = 600
    Top = 40
  end
  object dsPreviousProjects: TDataSource
    DataSet = PreviousProjects
    Left = 710
    Top = 40
  end
  object ObjectsCoords: TADOQuery
    Connection = GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select    *'
      'from      ObjectsCoords'
      'order by  N')
    Left = 670
    Top = 390
  end
  object dsObjectCoords: TDataSource
    DataSet = ObjectsCoords
    Left = 760
    Top = 390
  end
  object Project: TADOQuery
    Connection = RemoteCatConn
    CursorType = ctStatic
    DataSource = dsProjects
    EnableBCD = False
    Parameters = <
      item
        Name = 'All'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'Id'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select'#9#9'*'
      'from'#9#9'   Projects'
      'where'#9#9'   :All = 1 or Id = :Id')
    Left = 360
    Top = 180
  end
  object dsProject: TDataSource
    DataSet = Project
    Left = 450
    Top = 180
  end
  object CondDefs: TADOQuery
    Connection = GDBConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Section'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      'select * from dbo.CondDefs'
      'where Section = :Section'
      'order by N')
    Left = 680
    Top = 668
  end
  object dsExcelTable: TDataSource
    DataSet = ExcelTable
    Left = 770
    Top = 750
  end
end
