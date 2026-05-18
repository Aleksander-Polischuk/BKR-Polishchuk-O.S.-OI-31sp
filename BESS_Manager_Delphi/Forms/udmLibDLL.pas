unit udmLibDLL;

interface

uses
  System.SysUtils, System.Classes, System.Variants, Winapi.Windows, Winapi.Messages,
  System.Generics.Collections, DateUtils, frxClass,  System.StrUtils, Dialogs;

type
  TdmLibDLL = class(TDataModule)
  private

  public
     function EncryptString(const AText, APassword: string): string;
     function DecryptString(const AText, APassword: string): string;

     function GetMD5_FromFile(const FileName: string): string;
     function GetMD5_FromString(const AText: string): string;

     function Zip_CompressFile(const ASourceFile, AZipFile: string; var Error:string): Boolean;
     function Zip_DecompressFile(const AZipFile, AOutputDir: string; var Error:string): Boolean;
  end;

Type
   TCrypt_EncryptString = function(const AText, APassword: PChar; Buffer: PChar; BufSize: Integer): boolean; stdcall;
   TCrypt_DecryptString = function(const AText, APassword: PChar; Buffer: PChar; BufSize: Integer): boolean; stdcall;

   TCrypt_GetMD5_FromFile   = function(const FileName: PChar; Buffer: PChar; BufSize: Integer): boolean; stdcall;
   TCrypt_GetMD5_FromString = function(const AText: PChar; Buffer: PChar; BufSize: Integer): boolean; stdcall;

   TZip_CompressFile   = function(const ASourceFile, AZipFile: PChar): Integer; stdcall;
   TZip_DecompressFile = function(const AZipFile, AOutputDir: PChar): Integer; stdcall;

var
  dmLibDLL: TdmLibDLL;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TdmLibDLL.EncryptString(const AText, APassword: string): string;
var
  DLLHandle: HMODULE;
  GetEncrypt: TCrypt_EncryptString;
  Res : string;
  Buffer: array[0..255] of Char;
begin
  DLLHandle := LoadLibrary('Crypt.dll');
  Res := '';
  try
    if DLLHandle = 0 then
      begin
        ShowMessage('Неможливо завантажити Crypt.dll');
        exit;
      end;

    @GetEncrypt := GetProcAddress(DLLHandle, 'Crypt_EncryptString');
    if not Assigned(GetEncrypt) then
     begin
       ShowMessage('Функцію не знайдено Crypt.dll > Crypt_EncryptString');
       exit;
     end;

     if GetEncrypt(PChar(AText), PChar(APassword), Buffer, SizeOf(Buffer)) then
      Res := Buffer
    else
      ShowMessage('Помилка кодування');

  finally
    FreeLibrary(DLLHandle);
  end;

  Result := Res;
end;

function TdmLibDLL.DecryptString(const AText, APassword: string): string;
  var
  DLLHandle: HMODULE;
  GetDecrypt: TCrypt_DecryptString;
  Res : string;
  Buffer: array[0..255] of Char;
begin
  DLLHandle := LoadLibrary('Crypt.dll');
  Res := '';
  try
    if DLLHandle = 0 then
      begin
        ShowMessage('Неможливо завантажити Crypt.dll');
        exit;
      end;

    @GetDecrypt := GetProcAddress(DLLHandle, 'Crypt_DecryptString');
    if not Assigned(GetDecrypt) then
     begin
       ShowMessage('Функцію не знайдено Crypt.dll > Crypt_DecryptString');
       exit;
     end;

     if GetDecrypt(PChar(AText), PChar(APassword), Buffer, SizeOf(Buffer)) then
      Res := Buffer
    else
      ShowMessage('Помилка декодування');

  finally
    FreeLibrary(DLLHandle);
  end;

  Result := Res;
end;

//////////////////////////////////////////////////////////
////       MD5
/////////////////////////////////////////////////////////
function TdmLibDLL.GetMD5_FromFile(const FileName: string): string;
var
  DLLHandle: HMODULE;
  GetMD5: TCrypt_GetMD5_FromFile;
  Res : string;
  Buffer: array[0..255] of Char;
begin
  DLLHandle := LoadLibrary('Crypt.dll');
  Res := '';
  try
    if DLLHandle = 0 then
      begin
        ShowMessage('Неможливо завантажити Crypt.dll');
        exit;
      end;

    @GetMD5 := GetProcAddress(DLLHandle, 'Crypt_GetMD5_FromFile');
    if not Assigned(GetMD5) then
     begin
       ShowMessage('Функцію не знайдено Crypt.dll > Crypt_GetMD5_FromFile');
       exit;
     end;

     if GetMD5(PChar(FileName), Buffer, SizeOf(Buffer)) then
      Res := Buffer
    else
      ShowMessage('Помилка при обчисленні MD5');

  finally
    FreeLibrary(DLLHandle);
  end;

  Result := Res;
end;

function TdmLibDLL.GetMD5_FromString(const AText: string): string;
var
  DLLHandle: HMODULE;
  GetMD5: TCrypt_GetMD5_FromString;
  Res : string;
  Buffer: array[0..255] of Char;
begin
  DLLHandle := LoadLibrary('Crypt.dll');
  Res := '';
  try
    if DLLHandle = 0 then
      begin
        ShowMessage('Неможливо завантажити Crypt.dll');
        exit;
      end;

    @GetMD5 := GetProcAddress(DLLHandle, 'Crypt_GetMD5_FromString');
    if not Assigned(GetMD5) then
     begin
       ShowMessage('Функцію не знайдено Crypt.dll > Crypt_GetMD5_FromString');
       exit;
     end;

     if GetMD5(PChar(AText), Buffer, SizeOf(Buffer)) then
      Res := Buffer
    else
      ShowMessage('Помилка при обчисленні MD5');

  finally
     FreeLibrary(DLLHandle);
  end;

  Result := Res;
end;


/////////////////////////////////////////////////////////
///      ZIP
/////////////////////////////////////////////////////////

function TdmLibDLL.Zip_CompressFile(const ASourceFile, AZipFile: string; var Error:string): Boolean;
var
  DLLHandle: HMODULE;
  Zip: TZip_CompressFile;
  Res : boolean;
begin
  Res := false;
  DLLHandle := LoadLibrary('Gzip.dll');
  try
    if DLLHandle = 0 then
      begin
        ShowMessage('Неможливо завантажити Gzip.dll');
        exit;
      end;

    @Zip := GetProcAddress(DLLHandle, 'Zip_CompressFile');
    if not Assigned(Zip) then
      begin
        ShowMessage('Функцію не знайдено Crypt.dll > Zip_CompressFile');
        exit;
      end;

    var i := Zip(PChar(ASourceFile), PChar(AZipFile));

    Case i of
      0: Res := True;
      1: Error := 'Файл для архівації не знайдено';
      2: Error := 'Помилка архівації'
    End;

  finally
     FreeLibrary(DLLHandle);
  end;

 Result := Res;
end;

function TdmLibDLL.Zip_DecompressFile(const AZipFile, AOutputDir: string; var Error:string): Boolean;
var
  DLLHandle: HMODULE;
  Zip: TZip_DecompressFile;
  Res : boolean;
begin
  Res := false;
  DLLHandle := LoadLibrary('Gzip.dll');
  try
    if DLLHandle = 0 then
      begin
        ShowMessage('Неможливо завантажити Gzip.dll');
        exit;
      end;

    @Zip := GetProcAddress(DLLHandle, 'Zip_CompressFile');
    if not Assigned(Zip) then
      begin
        ShowMessage('Функцію не знайдено Crypt.dll > Zip_CompressFile');
        exit;
      end;

    var i := Zip(PChar(AZipFile), PChar(AOutputDir));

    Case i of
      0: Res := True;
      1: Error := 'Файл для архівації не знайдено';
      2: Error := 'Помилка архівації'
    End;

  finally
     FreeLibrary(DLLHandle);
  end;

 Result := Res;
end;

end.
