create or replace procedure tracing_code(p_string varchar2 := 'I love gradescope!') as
    x number := 10;
    t varchar2(10);
begin 
    for i in reverse 4..11 loop
        t := substr(p_string, 1, 1);
    end loop;
    
    while x <= 15 loop 
        t := t || 'x';
        if p_string != 'I love gradescope!' then 
            x := null;
        else
            x := x+1;
        end if;
       sys.dbms_output.put_line(t);
    end loop;
    sys.dbms_output.put_line(x);
end;
    
exec tracing_code('I hate gradescope');
