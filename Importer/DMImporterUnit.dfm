object DMImporter: TDMImporter
  Height = 346
  Width = 439
  object SQLCommands: TClientDataSet
    PersistDataPacket.Data = {
      7B0000009619E0BD0100000018000000040000000000030000007B0007536563
      74696F6E0400010000000000014E04000100000000000B436F6D6D616E644E61
      6D6501004900000001000557494454480200020032000B436F6D6D616E645465
      787404004B0000000100075355425459504502004900050054657874000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'CommandName; N'
    Params = <>
    Left = 40
    Top = 32
    object FSection: TIntegerField
      FieldName = 'Section'
    end
    object FN: TIntegerField
      FieldName = 'N'
    end
    object FCommandName: TStringField
      FieldName = 'CommandName'
      Size = 50
    end
    object FCommandText: TMemoField
      FieldName = 'CommandText'
      BlobType = ftMemo
    end
  end
end
