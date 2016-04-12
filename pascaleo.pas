program PascalEO;

type
  darray = array of boolean;
  dmatrix = array of darray;

var
  chromosome1:darray;
  chromosome2:darray;
  size:integer;
  i: integer;
  xover:dmatrix;

  function draw(chromosome:darray):Integer;
    var
      size:Integer;

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
    end;


function random_chromosome(size: integer):darray;
  var
    chromosome: darray;
    i:integer;
  begin
    setlength(chromosome,size);
    for i:=0 to size-1 do
      begin
        chromosome[i]:= (random(2) = 1 );
      end;
      exit(chromosome);
  end;


function compute_fitness(var chromosome : darray):integer;
  Var
  i:Integer;
  size: Integer;
  count: Integer;

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
    mutation_point:Integer;
    size:Integer;
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
    size:Integer;
    xover_point:Integer;
    scope:Integer;
    k:Integer;
    result:dmatrix;

  begin
    size:=length(chrom1);
    xover_point:=random(size-1);
    scope:= 1+random(size-xover_point-1);

    setlength(result,2);
    setlength(result[0],size);
    setlength(result[1],size);

    for k:=0 to xover_point-1 do
      begin
        result[0][k]:=chrom1[k];
        result[1][k]:=chrom2[k];
      end;

      for k:=xover_point to xover_point+scope-1 do
        begin
          result[0][k]:=chrom2[k];
          result[1][k]:=chrom1[k];
        end;

      for k:=xover_point+scope to size-1 do
        begin
          result[0][k]:=chrom1[k];
          result[1][k]:=chrom2[k];
        end;
      exit(result);
  end;
