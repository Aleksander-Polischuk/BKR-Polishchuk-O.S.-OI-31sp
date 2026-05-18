unit Stopwatch;

interface

type

  TStopwatch = class
  public
    class procedure Start(tag: string);
    class procedure Stop(tag: string);
    class procedure Clear;
    class procedure Show;
  end;

implementation

uses System.Generics.Collections, Windows, System.SysUtils, System.SyncObjs;

type
  TCallInfo = class
    tag: string;
    wholeTime: Int64;
    startTime: Int64;
    procOrder: boolean;
    hitcount: UInt64;
    constructor Create(tag: string; startTime: Int64);
    procedure Start(startTime: Int64);
    procedure Stop(stopTime: Int64);
  end;

var
  criticalSection: TCriticalSection;
  tagorder: TList<string>;
  call: TObjectDictionary<string, TCallInfo>;

constructor TCallInfo.Create(tag: string; startTime: Int64);
begin
  self.tag := tag;
  wholeTime := 0;
  hitcount := 1;
  self.startTime := startTime;
  procOrder := true;
end;

procedure TCallInfo.Start(startTime: Int64);
begin
  if procOrder then
    raise Exception.Create('Прежде чем повторно вызывать процедуру Start, сначала необходимо вызвать процедуру Stop для тэга "' + tag + '".');
  self.startTime := startTime;
  procOrder := true;
  Inc(hitcount);
end;

procedure TCallInfo.Stop(stopTime: Int64);
begin
  wholeTime := wholeTime - startTime + stopTime;
  procOrder := false;
end;

class procedure TStopwatch.Start(tag: string);
var
  t: Int64;
begin
  if QueryPerformanceCounter(t) then
  begin
    criticalSection.Enter;
    try
      if not call.ContainsKey(tag) then
      begin
        tagorder.Add(tag);
        call.Add(tag, TCallInfo.Create(tag, t));
      end
      else
        call[tag].Start(t);
    finally
      criticalSection.Leave;
    end;
  end;
end;

class procedure TStopwatch.Stop(tag: string);
var
  t: Int64;
begin
  if QueryPerformanceCounter(t) then
  begin
    criticalSection.Enter;
    try
      if (not call.ContainsKey(tag)) or (not call[tag].procOrder) then
        raise Exception.Create('Сначала необходимо вызвать процедуру Start для тэга "' + tag + '".')
      else
        call[tag].Stop(t);
    finally
      criticalSection.Leave;
    end;
  end;
end;

class procedure TStopwatch.Clear;
begin
  criticalSection.Enter;
  try
    tagorder.Clear;
    call.Clear;
  finally
    criticalSection.Leave;
  end;
end;

class procedure TStopwatch.Show;
var
  iCounterPerSec: Int64;
  tag: string;
  stringBuilder: TStringBuilder;
begin
  QueryPerformanceFrequency(iCounterPerSec);
  stringBuilder := TStringBuilder.Create;
  try
    criticalSection.Enter;
    try
      for tag in tagorder do
        if not call[tag].procOrder then
          stringBuilder.Append(tag + ': ' + FormatFloat('0.0000', call[tag].wholeTime / iCounterPerSec) + ' сек., вызовов: ' + IntToStr(call[tag].hitcount) + #13#10)
        else
          stringBuilder.Append('Для тэга "' + tag + '" не вызвали процедуру Stop.' + #13#10);
    finally
      criticalSection.Leave;
    end;
    OutputDebugString(PWideChar(stringBuilder.ToString));
  finally
    stringBuilder.Free;
  end;
end;

initialization
  criticalSection := TCriticalSection.Create;
  tagorder := TList<string>.Create;
  call := TObjectDictionary<string, TCallInfo>.Create([doOwnsValues]);

finalization
  if call.Count > 0 then
    TStopwatch.Show;
  tagorder.Free;
  call.Free;
  criticalSection.Free;

end.
