object DMSeams: TDMSeams
  Height = 300
  Width = 366
  object Seams: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = SeamsAfterPost
    Parameters = <>
    SQL.Strings = (
      'select * from Seams order by Description')
    Left = 32
    Top = 32
    object SeamsSeamId: TAutoIncField
      FieldName = 'SeamId'
      ReadOnly = True
    end
    object SeamsDescription: TWideStringField
      FieldName = 'Description'
      Size = 50
    end
    object SeamsShortName: TWideStringField
      FieldName = 'ShortName'
      Size = 50
    end
    object SeamsStrata: TFloatField
      FieldName = 'Strata'
      OnChange = SeamsStrataChange
    end
    object SeamsN: TFloatField
      FieldName = 'N'
    end
    object SeamsActual: TBooleanField
      FieldName = 'Actual'
    end
    object SeamsGroupSeamId: TWideStringField
      FieldName = 'GroupSeamId'
      Size = 12
    end
    object SeamsDateCreated: TDateTimeField
      FieldName = 'DateCreated'
    end
    object SeamsDateModified: TDateTimeField
      FieldName = 'DateModified'
    end
    object SeamsAdRoof: TBCDField
      FieldName = 'AdRoof'
      Precision = 18
      Size = 2
    end
    object SeamsAdBed: TBCDField
      FieldName = 'AdBed'
      Precision = 18
      Size = 2
    end
    object SeamsDdaRoof: TBCDField
      FieldName = 'DdaRoof'
      Precision = 18
      Size = 2
    end
    object SeamsDdaBed: TBCDField
      FieldName = 'DdaBed'
      Precision = 18
      Size = 2
    end
  end
  object dsSeams: TDataSource
    DataSet = Seams
    Left = 96
    Top = 32
  end
  object Parts: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = PartsAfterPost
    DataSource = dsSeams
    Parameters = <
      item
        Name = 'SeamId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    SQL.Strings = (
      'select * from Parts where SeamId = :SeamId')
    Left = 27
    Top = 96
  end
  object dsParts: TDataSource
    DataSet = Parts
    Left = 91
    Top = 96
  end
  object Coeffs: TADOQuery
    Connection = DM.GDBConnection
    CursorType = ctStatic
    AfterPost = CoeffsAfterPost
    DataSource = dsSeams
    Parameters = <
      item
        Name = 'SeamId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from Coeffs where SeamId = :SeamId')
    Left = 27
    Top = 156
  end
  object dsCoeffs: TDataSource
    DataSet = Coeffs
    Left = 91
    Top = 156
  end
end
