//------------------------------------------------------------------------------------------------------------
//********* Sobre ************
//Autor: Gisele de Melo
//Esse código foi desenvolvido com o intuito de aprendizado para o blog codedelphi.com, portanto não me
//responsabilizo pelo uso do mesmo.
//
//********* About ************
//Author: Gisele de Melo
//This code was developed for learning purposes for the codedelphi.com blog, therefore I am not responsible for
//its use.
//------------------------------------------------------------------------------------------------------------

unit Unit1;

interface

uses
  System.SysUtils, System.Classes, System.Threading, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    StartButton: TButton;
    Memo1: TMemo;
    procedure StartButtonClick(Sender: TObject);
  private
    procedure Log(const Msg: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Log(const Msg: string);
begin
  TThread.Synchronize(nil,
    procedure
    begin
      Memo1.Lines.Add(Msg);
    end);
end;

procedure TForm1.StartButtonClick(Sender: TObject);
var
  Task1, Task2, Task3: ITask;
begin
  Task1 := TTask.Create(
    procedure
    begin
      Log('Task 1 iniciada');
      Sleep(2000); // Simula um trabalho de 2 segundos
      Log('Task 1 concluída');
    end);

  Task2 := TTask.Create(
    procedure
    begin
      Log('Task 2 iniciada');
      Sleep(3000); // Simula um trabalho de 3 segundos
      Log('Task 2 concluída');
    end);

  Task3 := TTask.Create(
    procedure
    begin
      Log('Task 3 iniciada');
      Sleep(1000); // Simula um trabalho de 1 segundo
      Log('Task 3 concluída');
    end);

  Task1.Start;
  Task2.Start;
  Task3.Start;
end;

end.
