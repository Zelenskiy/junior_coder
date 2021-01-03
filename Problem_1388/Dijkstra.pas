program Dijkstra;

const
    inf=101;
    maxn = 100;
type
    vektor=array[1..maxn] of byte;
var
    start, finish: byte;
    n: byte;
    GR: array[1..maxn, 1..maxn] of byte;
    distance: vektor;


{algorithm Dijkstra}
procedure Dijkstra;
var
    count, index, i, u, min: byte;
    visited: array[1..maxn] of boolean;
begin
     for i:=1 to n do begin
          distance[i]:=inf;
          visited[i]:=false;
     end;
     distance[start]:=0;
     for count:=1 to n-1 do begin
          min:=inf;
          for i:=1 to n do
              if (not visited[i]) and
                  (distance[i]<=min) then begin
                      min:=distance[i];
                      index:=i;
              end;
          u:=index;
          visited[u]:=true;
          for i:=1 to n do
              if (not visited[i]) and
                 (GR[u, i]<>0) and
                 (distance[u]<>inf) and
                 (distance[u]+GR[u, i]<distance[i]) then
                      distance[i]:=distance[u]+GR[u, i];
     end;
end;

procedure ReadData;
var
    i,j,m: byte;
    v1,v2,weight: byte;
    f_in: text;
    prises: vektor;
begin
     Assign(f_in,'input.txt');
     reset(f_in);
     readln(f_in, n);
     for i:=1 to n do begin
         read(f_in, weight);
         prises[i] := weight;
     end;
     readln(f_in, m);
     for i:=1 to m do begin
         read(f_in, v1, v2);
         GR[v1,v2]:=prises[v1];
         GR[v2,v1]:=prises[v2];
     end;
     close(f_in);
     start := 1;
     finish := n;
end;

procedure WriteData;
var
    f_out: text;
    i,j:byte;
begin
     Assign(f_out,'output.txt');
     rewrite(f_out);
     if distance[finish] <> inf then
        writeln(f_out, distance[finish])
     else
        writeln(f_out, -1);
     close(f_out);
end;

{main block}


begin
     ReadData;
     Dijkstra;
     WriteData;


end.
