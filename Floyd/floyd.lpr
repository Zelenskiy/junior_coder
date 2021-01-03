program floyd;
const maxV=1000;
var D:array[1..maxV, 1..maxV] of longint;
    V: longint;


{алгоритм Флойда-Воршелла}
Procedure FU;
var i, j, k, inf: longint;
begin
	inf:=1000000;
	for i:=1 to V do D[i, i]:=0;

	for k:=1 to V do
		for i:=1 to V do
			for j:=1 to V do
				if (D[i, k]<>0) and (D[k, j]<>0) and (i<>j) then
					if (D[i, k]+D[k, j]<D[i, j]) or (D[i, j]=0) then
						D[i, j]:=D[i, k]+D[k, j];

	for i:=1 to V do
	begin
		for j:=1 to V do
			write(D[i, j]:4);
		writeln;
	end;
end;


procedure ReadData;
var
    i: longint;
    v1,v2,v3: longint;
    f_in: text;
begin
     Assign(f_in,'input.txt');
     reset(f_in);
     readln(f_in, V);
     for i:=1 to V do begin
         readln(f_in, v1, v2, v3);
         D[i,1]:=v1;
         D[i,2]:=v2;
         D[i,3]:=v3;
     end;
     close(f_in);
end;

procedure WriteData;
var
    i, j: longint;
    f_out: text;
begin
     Assign(f_out,'output.txt');
     rewrite(f_out);
     for i:=1 to V do begin
         for j:=1 to V do
           write(f_out, D[i,j], ' ');
           writeln(f_out);
     end;
     close(f_out);
end;

{main block}

begin
     ReadData;
     FU;
     WriteData;
end.

