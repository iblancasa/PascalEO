uses
    Crt{para ClrScr},
    Dos{para GetTime};

type
  darray = array of boolean;
  dmatrix = array of darray;


function draw(chromosome:darray):longint;
  var
    size:longint;
    i:longint;
  begin
    size:=length(chromosome);

    for i:=0 to size-1 do
      begin
        if chromosome[i] then
          write(1)
        else
          write(0);
      end;
    writeln();
    exit(0);
  end;


function random_chromosome(size: longint):darray;
  var
    chromosome: darray;
    i:longint;
  begin
    setlength(chromosome,size);
    for i:=0 to size-1 do
      begin
        chromosome[i]:= (random(2) = 1 );
      end;
      exit(chromosome);
  end;


function compute_fitness(var chromosome : darray):longint;
  Var
  i:longint;
  size: longint;
  count: longint;

  begin
    count:=0;
    size:=length(chromosome);

    for i:=0 to size do
      begin
        if chromosome[i] then
          begin
            count:=count+1
          end;
      end;
    exit(count);
  end;


function mutate1(var chromosome:darray):darray;
  Var
    mutation_point:longint;
    size:longint;
    new_chrom:darray;

  begin
    size:=length(chromosome);
    mutation_point:=random(size-1);
    new_chrom:=Copy(chromosome);
    new_chrom[mutation_point]:= NOT new_chrom[mutation_point];
    exit(new_chrom)
  end;


function crossover(var chrom1,chrom2: darray):dmatrix;
  var
    size:longint;
    xover_point:longint;
    scope:longint;
    k:longint;
    matrixresult:dmatrix;

  begin
    size:=length(chrom1);
    xover_point:=random(size-1);
    scope:= 1+random(size-xover_point-1);

    setlength(matrixresult,2);
    setlength(matrixresult[0],size);
    setlength(matrixresult[1],size);

    for k:=0 to xover_point-1 do
      begin
        matrixresult[0][k]:=chrom1[k];
        matrixresult[1][k]:=chrom2[k];
      end;

      for k:=xover_point to xover_point+scope-1 do
        begin
          matrixresult[0][k]:=chrom2[k];
          matrixresult[1][k]:=chrom1[k];
        end;

      for k:=xover_point+scope to size-1 do
        begin
          matrixresult[0][k]:=chrom1[k];
          matrixresult[1][k]:=chrom2[k];
        end;
      exit(matrixresult);
  end;
