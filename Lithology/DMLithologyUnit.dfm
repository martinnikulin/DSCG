object DMLithology: TDMLithology
  Height = 462
  Width = 677
  object SurveyLines: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select    LineId,'
      '          LineType,'
      '          N,'
      '          Description as slname,'
      '          X1, Y1, X2, Y2,'
      '          Lock'
      'from      Lines sl'
      'order by N')
    Left = 40
    Top = 24
  end
  object dsSurveyLines: TDataSource
    DataSet = SurveyLines
    Left = 112
    Top = 24
  end
  object LineHoles: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    DataSource = dsSurveyLines
    Parameters = <
      item
        Name = 'InterbedId'
        DataType = ftWideString
        Size = 16
        Value = '100'
      end
      item
        Name = 'LineId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 2
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
      'SELECT        lh.LineId,'
      '              bh.BoreholeId,'
      '              bh.HoleName,'
      '              lh.N,'
      '              lh.node,'
      '              lh.onprofile,'
      '              lh.SpreadAzimuth,'
      '              bh.X,'
      '              bh.Y,'
      '              bh.Z,'
      '              :InterbedId as InterbedId,'
      '              0 as DepthFrom,'
      '              1000000 as DepthTo'
      'FROM          Boreholes bh'
      'INNER JOIN    LineHoles lh ON'
      '              bh.BoreholeId = lh.BoreholeId'
      'WHERE         (lh.LineId = :LineId) or (:all = 1)'
      'ORDER BY N')
    Left = 40
    Top = 88
  end
  object dsLineHoles: TDataSource
    DataSet = LineHoles
    Left = 112
    Top = 88
  end
  object HoleSeams: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = HoleseamsAfterPost
    DataSource = dsLineHoles
    Parameters = <
      item
        Name = 'BoreholeId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 80
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
      'select   *'
      'from      HoleSeams'
      'where     BoreholeId = :BoreholeId and'
      '          InterbedId = :InterbedId'
      'order by  DepthTo')
    Left = 280
    Top = 32
  end
  object dsHoleseams: TDataSource
    DataSet = HoleSeams
    Left = 344
    Top = 32
  end
  object dsLithology: TDataSource
    DataSet = Lithology
    Left = 344
    Top = 96
  end
  object Samples: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = SamplesAfterPost
    BeforeDelete = SamplesBeforeDelete
    DataSource = dsLineHoles
    Parameters = <
      item
        Name = 'BoreholeId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 147
      end>
    SQL.Strings = (
      'select    0 as HoleSeamId,'
      '          0 as SampLevel,'
      '          CONVERT(bit, 0) as Accepted,'
      '          s.*'
      'from      Samples s'
      'where     BoreholeId = :BoreholeId'
      'order by  DepthTo asc,'
      '          DepthFrom desc')
    Left = 280
    Top = 174
    object Samplessample_id: TIntegerField
      FieldName = 'SampleId'
    end
    object Samplesaccepted: TBooleanField
      FieldName = 'Accepted'
    end
    object Samplesdepth_from: TBCDField
      FieldName = 'DepthFrom'
      Precision = 18
      Size = 2
    end
    object Samplesdepth_to: TBCDField
      FieldName = 'DepthTo'
      Precision = 18
      Size = 2
    end
    object SamplesAd_index: TIntegerField
      FieldName = 'AdIndex'
    end
    object Samplesbad: TBooleanField
      FieldName = 'Bad'
    end
    object SamplessampleN: TWideStringField
      FieldName = 'NSample'
      Size = 100
    end
    object Sampleshole_id: TIntegerField
      FieldName = 'BoreholeId'
    end
    object SamplesAd: TFloatField
      FieldName = 'Ad'
    end
    object SamplesAdFloat: TFloatField
      FieldName = 'AdFloat'
    end
    object SamplesAdGbs: TFloatField
      FieldName = 'AdGbs'
    end
    object SamplesAdGeophys: TFloatField
      FieldName = 'AdGeophys'
    end
    object SamplesAdSeam: TFloatField
      FieldName = 'AdSeam'
    end
  end
  object dsSamples: TDataSource
    DataSet = Samples
    Left = 344
    Top = 174
  end
  object dsAssays: TDataSource
    DataSet = Assays
    Left = 518
    Top = 176
  end
  object AssayGroups: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    DataSource = dsSamples
    Parameters = <>
    SQL.Strings = (
      'select    GroupId as GroupId,'
      '          N,'
      '          GroupName'
      'from      AssayGroups ag'
      
        'where'#9'GroupId in (select distinct GroupId from AssayVars where A' +
        'ctual = 1)'
      'order by  N')
    Left = 446
    Top = 96
  end
  object Assays: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = AssaysAfterPost
    DataSource = dsSamples
    Parameters = <
      item
        Name = 'SampleId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 5993
      end>
    SQL.Strings = (
      'select'#9#9'av.GroupId,'
      #9#9#9'    av.VarId,'
      #9#9#9'    av.N,'
      #9#9#9'    av.[Description],'
      #9#9#9'    A.Val'
      'from      AssayVars av'
      'left join'#9'Assays A on'
      #9#9#9'    av.VarId = A.VarId and'
      #9#9#9'    A.SampleId = :SampleId'
      'where'#9#9'  av.Actual = 1'
      'order by'#9'av.N')
    Left = 446
    Top = 176
  end
  object dsAssayGroups: TDataSource
    DataSet = AssayGroups
    Left = 518
    Top = 96
  end
  object ColumnLith: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = LithologyAfterPost
    DataSource = dsHoleseams
    Parameters = <
      item
        Name = 'HoleSeamId'
        Attributes = [paSigned]
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
      end>
    SQL.Strings = (
      'select'#9#9'r.RockGroupId,'
      #9#9#9'Th,'
      #9#9#9'Angle,'
      #9#9#9'Core,'
      #9#9#9'CoreProc,'
      
        '      convert(nvarchar(10), ThNorm) + '#39' ('#39' + convert(nvarchar(10' +
        '), CoreNorm) + '#39')'#39' as lithtext'
      'from'#9#9'HoleSeams hs'
      'inner join'#9'Lithology l on'
      #9#9#9'l.BoreholeId = hs.BoreholeId and'
      #9#9#9'l.DepthFrom >= hs.DepthFrom and'
      #9#9#9'l.DepthTo <= hs.DepthTo'
      'inner join'#9'Rocks r on r.RockId = l.RockId'
      'where'#9#9'HoleSeamId = :HoleSeamId and'
      #9#9#9'InterbedId = :InterbedId')
    Left = 280
    Top = 248
  end
  object ColumnSamps: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = LithologyAfterPost
    DataSource = dsHoleseams
    Parameters = <
      item
        Name = 'HoleSeamId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select'#9#9's.SampleId,'
      #9#9#9's.DepthFrom,'
      #9#9#9's.DepthTo,'
      #9#9#9'hss.SampStage,'
      #9#9#9'hss.Accepted'
      'from'#9#9'Samples s'
      'inner join'#9'HSSamps hss on hss.SampleId = s.SampleId'
      'where'#9#9'HoleSeamId = :HoleSeamId'
      'order by'#9'DepthTo, DepthFrom desc')
    Left = 344
    Top = 248
  end
  object Lithology: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    BeforeDelete = LithologyBeforeDelete
    DataSource = dsLineHoles
    Parameters = <
      item
        Name = 'BoreholeId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 80
      end
      item
        Name = 'DepthFrom'
        Attributes = [paSigned, paNullable]
        DataType = ftFMTBcd
        NumericScale = 19
        Precision = 38
        Size = 19
        Value = '247,25'
      end
      item
        Name = 'DepthTo'
        Attributes = [paSigned, paNullable]
        DataType = ftFMTBcd
        NumericScale = 19
        Precision = 38
        Size = 19
        Value = '248,25'
      end
      item
        Name = 'all'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end>
    SQL.Strings = (
      'select'#9#9#9'l.LithologyId as LithologyId,'
      #9#9#9#9'l.BoreholeId,'
      #9#9#9#9'l.DepthFrom as DepthFrom,'
      #9#9#9#9'l.DepthTo as DepthTo,'
      #9#9#9#9'l.Angle,'
      #9#9#9#9'l.Th as Th,'
      #9#9#9#9'l.ThNorm as ThNorm,'
      #9#9#9#9'l.Core,'
      #9#9#9#9'l.CoreNorm as CoreNorm,'
      #9#9#9#9'l.CoreProc as CoreProc,'
      #9#9#9#9'l.RockId as RockId,'
      #9#9#9#9'l.SolidRock,'
      #9#9#9#9'l.Formation,'
      #9#9#9#9'--s.Description as SeamName'
      '        '#39#39' as SeamName'
      'from        '#9'Lithology l'
      
        'where   '#9#9'(l.BoreholeId = :BoreholeId) and ((l.DepthFrom >= :Dep' +
        'thFrom) and (l.DepthTo <= :DepthTo) or (:all = 1))'
      'order by  '#9#9'l.BoreholeId, l.DepthTo'
      '')
    Left = 280
    Top = 96
    object LithologyLithologyId: TAutoIncField
      FieldName = 'LithologyId'
      ReadOnly = True
    end
    object Lithologyhole_id: TIntegerField
      FieldName = 'BoreholeId'
    end
    object LithologyDepthFrom: TBCDField
      FieldName = 'DepthFrom'
      OnChange = LithologyDepthFromChange
      Precision = 18
      Size = 2
    end
    object LithologyDepthTo: TBCDField
      FieldName = 'DepthTo'
      OnChange = LithologyDepthToChange
      Precision = 18
      Size = 2
    end
    object LithologyAngle: TBCDField
      FieldName = 'Angle'
      OnChange = LithologyAngleChange
      Precision = 18
      Size = 2
    end
    object LithologyTh: TBCDField
      FieldName = 'Th'
      Precision = 18
      Size = 2
    end
    object LithologyThNorm: TBCDField
      FieldName = 'ThNorm'
      OnChange = LithologyThNormChange
      Precision = 18
      Size = 2
    end
    object LithologyCore: TBCDField
      FieldName = 'Core'
      OnChange = LithologyCoreChange
      Precision = 18
      Size = 2
    end
    object LithologyCoreNorm: TBCDField
      FieldName = 'CoreNorm'
      OnChange = LithologyCoreNormChange
      Precision = 18
      Size = 2
    end
    object LithologyCoreProc: TBCDField
      FieldName = 'CoreProc'
      OnChange = LithologyCoreProcChange
      Precision = 18
      Size = 0
    end
    object LithologyRockId: TIntegerField
      FieldName = 'RockId'
    end
    object LithologySolidRock: TBooleanField
      FieldName = 'SolidRock'
    end
    object LithologySvita: TIntegerField
      FieldName = 'Formation'
    end
    object LithologySeamName: TWideStringField
      FieldName = 'SeamName'
      Size = 50
    end
  end
  object dsAssaysCDS: TDataSource
    DataSet = AssaysCDS
    Left = 512
    Top = 248
  end
  object AssaysCDS: TClientDataSet
    PersistDataPacket.Data = {
      A00000009619E0BD010000001800000006000000000003000000A00005566172
      496404000100000000000B4465736372697074696F6E01004A00000001000557
      494454480200020064000356616C01004A000000010005574944544802000200
      64000747726F757049640400010000000000014E080004000000000007436861
      6E676564020003000000000001000D44454641554C545F4F5244455202008200
      00000000}
    Active = True
    Aggregates = <>
    Filtered = True
    FieldDefs = <
      item
        Name = 'VarId'
        DataType = ftInteger
      end
      item
        Name = 'Description'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'Val'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'GroupId'
        DataType = ftInteger
      end
      item
        Name = 'N'
        DataType = ftFloat
      end
      item
        Name = 'Changed'
        DataType = ftBoolean
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'N'
    Params = <>
    StoreDefs = True
    Left = 448
    Top = 248
    object AssaysCDSvar_id: TIntegerField
      FieldName = 'VarId'
    end
    object AssaysCDSdescription: TWideStringField
      FieldName = 'Description'
      Size = 50
    end
    object AssaysCDSval: TWideStringField
      FieldName = 'Val'
      OnChange = AssaysCDSvalChange
      Size = 50
    end
    object AssaysCDSgroup_id: TIntegerField
      FieldName = 'GroupId'
    end
    object AssaysCDSnn: TFloatField
      FieldName = 'N'
    end
    object AssaysCDSChanged: TBooleanField
      FieldName = 'Changed'
    end
  end
end
