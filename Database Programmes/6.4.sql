Table used:

	NAME             MARK
	---------- ----------
	jerin              85
	shyam              73
	linto              69
	rakhesh            84


SQL> create or replace function fgrade(n_name IN varchar) return varchar
  2  IS
  3  g varchar(1);
  4  mk number(2);
  5  Begin
  6  select mark into mk from student where name=n_name;
  7  if mk>90 then
  8  g:='x';
  9  dbms_output.put_line('Grade: ' || g );
 10  else if mk>80 then
 11  g:='A';
 12  dbms_output.put_line('Grade: ' || g );
 13  else if mk>60 then
 14  g:='B';
 15  dbms_output.put_line('Grade: ' || g );
 16  else if mk>50 then
 17  g:='C';
 18  dbms_output.put_line('Grade: ' || g );
 19  else
 20  g:='F';
 21  dbms_output.put_line('Grade: ' || g );
 22  end if;
 23  end if;
 24  end if;
 25  end if;
 26  return g;
 27  End fgrade;
 28  /

Function created.

SQL> set serveroutput on
SQL> select fgrade('rakhesh') from dual;

FGRADE('RAKHESH')
--------------------------------------------------------------------------------
A

Grade: A