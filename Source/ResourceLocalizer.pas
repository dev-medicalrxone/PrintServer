unit ResourceLocalizer;

interface

uses Classes, Windows;

type
  TResourceLocalizer = class
    class procedure GetLanguages(const Strings : TStrings);
    class function GetString(const Offset, Position : integer) : string;
    class procedure GetStrings(const Strings : TStrings; Offset : integer; Positions : array of integer);
  end;

implementation

uses UntMain;

const
  MaxBuffer = 255;

{ TResourceLocalizer }

class procedure TResourceLocalizer.GetLanguages(const Strings : TStrings);
const
  delta = 1000;
var
  buffer : array[0..MaxBuffer] of char;
  ls : integer;
  position : integer;
begin
  position := delta;
  Strings.Clear;
  ls := LoadString(hInstance, position, buffer, sizeof(buffer));
  while ls <> 0 do
  begin
    Strings.AddObject(buffer, TObject(position));
    position := position + delta;
    ls := LoadString(hInstance, position, buffer, sizeof(buffer));
  end;
end;

class function TResourceLocalizer.GetString(const Offset, Position: integer) : string;
var
  buffer : array[0..MaxBuffer] of char;
  ls : integer;
begin
  Result := '';
  ls := LoadString(hInstance, FrmMain.LanguageResOffset + Position, buffer, sizeof(buffer));
  if ls <> 0 then
  begin
    Result := buffer;
  end;
end;

class procedure TResourceLocalizer.GetStrings(const Strings: TStrings; Offset : integer; Positions : array of integer);
var
  buffer : array[0..MaxBuffer] of char;
  ls : integer;
  idx : integer;
begin
  Strings.Clear;
  for idx := Low(Positions) to High(Positions) do
  begin
    ls := LoadString(hInstance, Offset + Positions[idx], buffer, sizeof(buffer));
    if ls <> 0 then
    begin
      Strings.Add(buffer);
    end;
  end;
end;

end.
