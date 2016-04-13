{$INCLUDE pascaleo.pas}


var
  iterations:longint;
  top_length:longint;
  tama:longint;
  measured_time:real;
  chromosome1,chromosome2:darray;

function calcule_time(var chromosome1,chromosome2:darray; number:longint):real;
  var
    i:longint;
    h, m, s, c : Word;
    inicio, final: real;

  begin
    GetTime(h,m,s,c);
    inicio := c/100+s+m*60+h*60*60;

    for i:=0 to number do
      begin
        crossover(chromosome1,chromosome2);
      end;

      GetTime(h,m,s,c);
      final := c/100+s+m*60+h*60*60;
      exit(final-inicio);
  end;


begin
  iterations:=100000;
  tama:=16;
  top_length:=32768;
  measured_time:=0;


  while tama<top_length do
    begin
      chromosome1:=random_chromosome(tama);
      chromosome2:=random_chromosome(tama);
      measured_time:=calcule_time(chromosome1, chromosome2, iterations);
      write('Pascal-XOver-BitVector ', tama);
      writeln(' ', measured_time:2:2);
      tama:=tama*2;
    end;
end.
