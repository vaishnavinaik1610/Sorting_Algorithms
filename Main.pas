unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Notification, SortThread, Template;

type
  TFuncOfInt = reference to function(x: Integer): Integer;

  TShowMessage = reference to procedure (aMsg : String);

  TFrm_Main = class(TForm)
    BTN_Sort: TButton;
    Frame_QuickSort: TFrame_Template;
    Frame_BubbleSort: TFrame_Template;
    Frame_MergeSort: TFrame_Template;
    TFrame_SelectionSort: TFrame_Template;
    procedure FormShow(Sender: TObject);
    procedure BTN_SortClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    IsSorted : Boolean;
    BubbleSort, MergeSort, QuickSort, Selection: TThread;
    A : Array [0..cMax] of integer;
    procedure CreateThreads;
  public
    { Public declarations }
  end;

var
  Frm_Main: TFrm_Main;

implementation

{$R *.dfm}

uses Threading;

procedure TFrm_Main.BTN_SortClick(Sender: TObject);
begin
  if IsSorted then CreateThreads;
  try
    BubbleSort.Start;
    MergeSort.Start;
    QuickSort.Start;
    Selection.Start;
  finally
    IsSorted := True;
  end;
end;

procedure TFrm_Main.FormDestroy(Sender: TObject);
begin
  BubbleSort.Free;
  MergeSort.Free;
  QuickSort.Free;
  Selection.Free;
end;

procedure TFrm_Main.CreateThreads;
begin
  BubbleSort := TBubbleSort.Create(Frame_BubbleSort, A);
  MergeSort  := TMergeSort.Create(Frame_MergeSort, A);
  QuickSort  := TQuickSort.Create(Frame_QuickSort, A);
  Selection  := TSelection.Create(TFrame_SelectionSort, A);
end;

procedure TFrm_Main.FormShow(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to cMax-1 do
    A[i] := Random(500);

  IsSorted := False;
  CreateThreads;
end;

end.
