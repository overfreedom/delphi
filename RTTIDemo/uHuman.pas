unit uHuman;

interface
  type
    THuman = class(TObject)
      public
        name: string;
        age: Integer;
        constructor Create;
    end;

implementation

{ THumna }

constructor THuman.Create;
begin
  name :='john';
  age := 18;
end;

end.
