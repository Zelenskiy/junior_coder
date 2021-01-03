program Dijkstra;

const
    inf=1000000;
    maxn = 100;
type
    vektor=array[1..maxn] of integer;
var
    start, finish: integer;
    n: integer;
    GR: array[1..maxn, 1..maxn] of integer;
    distance: vektor;


{algorithm Dijkstra}
procedure Dijkstra;
var
    count, index, i, u, min: integer;
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
    i,j: integer;
    m,v1,v2,weight: integer;
    f_in: text;
begin
     Assign(f_in,'input.txt');
     reset(f_in);
     readln(f_in, n, start, finish);
     for i:=1 to n do begin
         for j:=1 to n do begin
           read(f_in, weight);
           if weight = -1 then weight:= 1000000;
           GR[i,j]:=weight;
         end;
     end;
     close(f_in);
end;

procedure WriteData;
var
    f_out: text;
begin
     Assign(f_out,'output.txt');
     rewrite(f_out);
     writeln(f_out, distance[finish]);
     close(f_out);
end;

{main block}

begin
     ReadData;
     Dijkstra;
     WriteData;
end.
