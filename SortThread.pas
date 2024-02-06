unit SortThread;

{This unit contains implemention of various sorting algorithms}

interface

uses
  System.Classes, Vcl.StdCtrls, System.SysUtils, Template;

const
  cMax = 20;

type
  TSortThread = class(TThread)
  private
    { Private declarations }
    A : Array [0..cMax] of integer;
    FListBox: TMemo;
    FTimeInfo: TLabel;
    FProc: TProc;
  protected
    procedure Sort; virtual; abstract;
    procedure Execute; override;
    procedure UpdateListAtIndex(index: Integer);
  public
    constructor Create(aTemplate: TFrame_Template; aArray: Array of integer);
  end;

  TBubbleSort = class(TSortThread)
    private
    protected
      procedure Sort; override;
  end;

  TMergeSort = class(TSortThread)
    private
    protected
      procedure Sort; override;
  end;

  TQuickSort = class(TSortThread)
    private
    protected
      procedure Sort; override;
  end;

  TSelection = class(TSortThread)
    private
    protected
      procedure Sort; override;
  end;

implementation

uses System.Diagnostics, Main;

{ TNewProcess }

constructor TSortThread.Create(aTemplate: TFrame_Template; aArray: Array of integer);
var
  i : integer;
begin
  inherited Create (True);
  FreeOnTerminate := False;
  FListBox := aTemplate.ED_ListBox;
  FTimeInfo := aTemplate.LB_TimeInfo;

  Synchronize(  procedure
                begin
                  FListBox.Clear;
                end
             );

  for i := 0 to cMax do
  begin
    A[i] := aArray[i];
    Synchronize(  procedure
                  begin
                    FListBox.Lines.Add( IntToStr( A[i] ) );
                  end
               );
  end;
end;

procedure TSortThread.Execute;
var
  Stopwatch: TStopwatch;
begin
 { Synchronize(  procedure
                begin
                  FTimeInfo.Caption := 'Started sorting . . .';
                end
             );  }
  Stopwatch := TStopwatch.StartNew;
  Sort();
  Stopwatch.Stop;
  Synchronize(  procedure
                begin
                  FTimeInfo.Caption := 'Sorting completed in ' +
                    FormatFloat('0.##', Stopwatch.Elapsed.TotalSeconds)  + ' seconds'
                end
             );
end;

procedure TSortThread.UpdateListAtIndex(index: Integer);
begin
  Synchronize(  procedure
                begin
                  FListBox.Lines[index] := IntToStr( A[index] );
                end
             );
end;

procedure TBubbleSort.Sort();
  procedure BubbleSort(aLastIndex : integer);
  var
   i,Tmp : integer;
  begin
    if aLastIndex < 1 then exit;

    for i := Low(A) to aLastIndex do
    begin
      if A[i] > A[i+1] then
      begin
        Tmp := A[i];
        A[i] := A[i+1];
        A[i+1] := Tmp;
        UpdateListAtIndex(i);
        UpdateListAtIndex(i+1);
      end;
    end;
    BubbleSort(aLastIndex-1);
  end;

begin
  BubbleSort(High(A));
end;

procedure TMergeSort.Sort;
  procedure Merge(L, M, R: Integer);
  var
    I, J, K: Integer;
    N1, N2: Integer;
    LeftArr, RightArr: array of Integer;
  begin
    N1 := M - L + 1;
    N2 := R - M;

    SetLength(LeftArr, N1);
    SetLength(RightArr, N2);

    for I := 0 to N1 - 1 do
      LeftArr[I] := A[L + I];

    for J := 0 to N2 - 1 do
      RightArr[J] := A[M + 1 + J];

    I := 0;
    J := 0;
    K := L;

    while (I < N1) and (J < N2) do
    begin
      if LeftArr[I] <= RightArr[J] then
      begin
        A[K] := LeftArr[I];
        Inc(I);
      end
      else
      begin
        A[K] := RightArr[J];
        Inc(J);
      end;
      UpdateListAtIndex(K);
      Inc(K);
    end;

    while I < N1 do
    begin
      A[K] := LeftArr[I];
      UpdateListAtIndex(K);
      Inc(I);
      Inc(K);
    end;

    while J < N2 do
    begin
      A[K] := RightArr[J];
      UpdateListAtIndex(K);
      Inc(J);
      Inc(K);
    end;
  end;

  procedure MergeSort(L, R: Integer);
  var
    M: Integer;
  begin
    if L < R then
    begin
      M := L + (R - L) div 2;
      MergeSort(L, M);
      MergeSort(M + 1, R);
      Merge(L, M, R);
    end;
  end;

begin
  MergeSort(Low(A), High(A));
end;

procedure TQuickSort.Sort;
  procedure QuickSort(iLo, iHi: Integer) ;
   var
     Lo, Hi, Pivot, T: Integer;
   begin
     Lo := iLo;
     Hi := iHi;
     Pivot := A[(Lo + Hi) div 2];
     repeat
       while A[Lo] < Pivot do Inc(Lo) ;
       while A[Hi] > Pivot do Dec(Hi) ;
       if Lo <= Hi then
       begin
         T := A[Lo];
         A[Lo] := A[Hi];
         A[Hi] := T;
         UpdateListAtIndex(Lo);
         UpdateListAtIndex(Hi);
         Inc(Lo) ;
         Dec(Hi) ;
       end;
     until Lo > Hi;
     if Hi > iLo then QuickSort(iLo, Hi) ;
     if Lo < iHi then QuickSort(Lo, iHi) ;
   end;

begin
  QuickSort(Low(A), High(A));
end;

procedure TSelection.Sort;
var
  i,j,Tmp,min_idx : integer;
begin
  for i := Low(A) to High(A) do
  begin
    min_idx := i;
    for j := i+1 to High(A) do
    begin
      if A[j] < A[min_idx] then
        min_idx := j;
    end;
    if min_idx <> i then
    begin
      Tmp := A[i];
      A[i] := A[min_idx];
      A[min_idx] := Tmp;
      UpdateListAtIndex(i);
      UpdateListAtIndex(min_idx);
    end;
  end;
end;

end.
