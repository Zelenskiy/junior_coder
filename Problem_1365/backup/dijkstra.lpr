program Dijkstra;

const
    inf=maxint;
    maxn = 10000;
type
    vektor=array[1..maxn] of longint;
var
    start, finish: longint;
    n: longint;
    GR: array[1..maxn, 1..maxn] of longint;
    distance: vektor;


{algorithm Dijkstra}
procedure Dijkstra;
var
    count, index, i, u, min: longint;
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
    i,j: longint;
    m,v1,v2,weight: longint;
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
    i: longint;
    f_out: text;
begin
     Assign(f_out,'output.txt');
     rewrite(f_out);
     writeln(f_out, distance[finish]);

     //for i:=1 to n do

         //if distance[i]<>inf then
         //    writeln(f_out, start,' > ', i,' = ', distance[i])
         //else
         //    writeln(f_out, start,' > ', i, ' = ', 'no');
     //writeln(f_out);
     close(f_out);
end;

{main block}

begin
     ReadData;
     Dijkstra;
     WriteData;
end.
