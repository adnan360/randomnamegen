// This code is protected by GPL v2 License
// which is available from:
// https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html
// or maybe accompanied with this code.
// The code is written by Adnan Shameem
// http://lazplanet.blogspot.com
unit frm1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

const
    min_length = 4;
    max_length = 10;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function RandomRange(min: integer; max: integer): integer; overload;
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

  vowels     : array [1..5]  of char = ('a', 'e', 'i', 'o', 'u');
  consonants : array [1..21] of char = ('b', 'c', 'd', 'f', 'g',
                                       'h', 'j', 'k', 'l', 'm',
                                       'n', 'p', 'q', 'r', 's',
                                       't', 'v', 'w', 'x', 'y',
                                       'z');


implementation

{$R *.lfm}

{ TForm1 }

function TForm1.RandomRange(min: integer; max: integer):integer;
begin
  // min_length is the minimum. So we ensure that even if random()
  // returns 0 (zero) we at least have min_length.
  // + 1 because a value of less than max_length would be returned.
  Result := min + Random((max + 1) - min);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  mylength : integer;
  i : Integer;
  final_name: string;
  temp:char;
  str:string;
begin

  mylength := RandomRange(min_length, max_length);

  for i := 1 to (mylength div 2) do begin
      temp := consonants[RandomRange(1, 21)];
      final_name := final_name + temp;

      temp := vowels[RandomRange(1, 5)];
      final_name := final_name + temp;
  end;

  if length(final_name) > 0 then begin
    str := UpperCase(final_name[1]);
    final_name[1] := str[1];
  end;
  Edit1.Text:=final_name;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  Button1Click(nil);
end;

end.
