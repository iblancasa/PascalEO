{$INCLUDE pascaleo.pas}




var
  iterations:longint;
  top_length:longint;
  tama:longint;
  measured_time:real;

function calcule_time(number,tama:longint):real;
  var
    i:longint;
    chromosome:darray;
    h, m, s, c : Word;
    inicio, final: real;

  begin
    GetTime(h,m,s,c);
    inicio := c/100+s+m*60+h*60*60;

    for i:=0 to number do
      begin
        chromosome:=random_chromosome(tama);
        compute_fitness(chromosome);
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
      measured_time:=calcule_time(iterations,tama);
      write('Pascal-BitVector ', tama);
      writeln(' ', measured_time:2:2);
      tama:=tama*2;
    end;
end.
