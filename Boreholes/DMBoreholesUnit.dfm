object DMBoreholes: TDMBoreholes
  Height = 283
  Width = 200
  object dsBoreholes: TDataSource
    DataSet = Boreholes
    Left = 112
    Top = 24
  end
  object dsSurvey: TDataSource
    DataSet = Survey
    Left = 112
    Top = 80
  end
  object dsSurveyLines: TDataSource
    DataSet = SurveyLines
    Left = 112
    Top = 136
  end
  object dsLineHoles: TDataSource
    DataSet = LineHoles
    Left = 112
    Top = 192
  end
  object LineHoles: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = LineHolesAfterPost
    DataSource = dsSurveyLines
    Parameters = <
      item
        Name = 'LineId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'all'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT        LH.LineId AS LineId,'
      '              LH.BoreholeId AS BoreholeId,'
      '              Boreholes.HoleName,'
      '              -999999 AS DepthFrom,'
      '              999999 AS DepthTo,'
      '              LH.N AS N,'
      '              LH.node,'
      '              LH.onprofile,'
      '              LH.SpreadAzimuth AS shift,'
      '              Boreholes.X,'
      '              Boreholes.Y,'
      '              Boreholes.Z'
      'FROM          Boreholes'
      'INNER JOIN    dbo.LineHoles LH ON'
      '              Boreholes.BoreholeId = LH.BoreholeId'
      'WHERE         (LH.LineId = :LineId) or (:all = 1)'
      'ORDER BY N')
    Left = 32
    Top = 192
  end
  object Survey: TADOQuery
    Connection = DM.GDBConnection
    AfterPost = SurveyAfterPost
    DataSource = dsBoreholes
    Parameters = <
      item
        Name = 'BoreholeId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from Survey where BoreholeId = :BoreholeId')
    Left = 32
    Top = 80
  end
  object Boreholes: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterInsert = BoreholesAfterInsert
    AfterPost = BoreholesAfterPost
    AfterDelete = BoreholesAfterDelete
    Parameters = <>
    SQL.Strings = (
      'select * from Boreholes order by HoleName')
    Left = 32
    Top = 24
  end
  object SurveyLines: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterInsert = SurveyLinesAfterInsert
    AfterPost = SurveyLinesAfterPost
    Parameters = <>
    SQL.Strings = (
      'select * from Lines order by N')
    Left = 32
    Top = 136
  end
end
