*&---------------------------------------------------------------------*
*& Report ZABAP_SYNTAX
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABAP_SYNTAX NO STANDARD PAGE HEADING.

WRITE: 'Pre-defined VARIABLES' COLOR 6 INTENSIFIED ON.

ULINE.

"TYPE C - TEXT (DATA TYPE IS USED TO DEFINE CHARACTERS/ STRING DATA VARIABLES. THE DEFAULT LENGTH IS 1.)

WRITE: / 'VARIABLE TYPE "C"' COLOR 3 INVERSE ON.

Data:  gv_Movie_Title(50) type c,
      gv_Actor(50) type c,
      gv_Actress(35) type c,
      gv_Genre(35) type c,
      gv_var.

gv_Movie_Title = 'Spider Man'.
gv_Actor = 'Tom Holland'.
gv_Actress = 'Zendiya'.
gv_Genre = 'Superhero'.
gv_var = 'Music'.

Write: / 'Movie Title:', gv_Movie_Title,
/ 'Actor:', gv_Actor,
/ 'Actress:', gv_Actress,
/ 'Genre:', gv_Genre,
/ 'Variable:', gv_var.

ULINE.

"&---------------------------------------------------------------------*

WRITE: / 'VARIABLES with "I"' COLOR 6 INVERSE ON.

Data: gv_position type i.

gv_Movie_Title = 'Spider Man'.
gv_position = 11.

Write: / gv_Movie_Title.
write: / 'Integer POSITION =' COLOR 7 INVERSE ON, gv_position.

gv_Movie_Title = 'AVENGERS'.
gv_position = 2.

Write: / gv_Movie_Title.
write: / 'Integer POSITION =' COLOR 7 INVERSE ON, gv_position.

ULINE.


"&---------------------------------------------------------------------*

"Type 'I' is Integers ( We can use for Positive and Negative Numbers, no decimals allowed.)
"Type 'N' is Numbers (Can be used only to write Positive Numbers, no negative/ no decimals are allowed) and (The fixed length of number is 1 so that We have to define num length)

WRITE : 'TYPE "I" AND "N"' COLOR 6 INVERSE ON.

DATA: GV_POS TYPE I,
      GV_NUM(10) TYPE N.

GV_POS = 123 * -1 .
GV_NUM = 123.

WRITE: / 'TYPE I = ' COLOR 5 INVERSE ON , GV_POS,
       / 'Type N = ' COLOR 5 INVERSE ON, GV_NUM.

Uline.

"&---------------------------------------------------------------------*

"TYPE 'P' - Packed Numbers (Decimals and Calculations.)

WRITE : 'TYPE "P"' COLOR 6 INVERSE ON.

DATA: GV_SAL TYPE P DECIMALS 2,
      GV_TAX TYPE P DECIMALS 5,
      GV_TAMT TYPE P.

GV_SAL = '420000.62'.
GV_TAX = '23.445'.
GV_TAMT = '23.445' * 12.

WRITE: / 'SALARY = ' COLOR 7 INVERSE ON, GV_SAL,
       / 'TAX PER MONTH = ' COLOR 7 INVERSE ON, GV_TAX,
       / 'TAX AMOUNT CALCULATION PER YEAR = ' COLOR 7 INVERSE ON, GV_TAMT.

ULINE.

"&---------------------------------------------------------------------*

WRITE:/ 'DATA ELEMENTS AND TABLE FIELDS' COLOR 5 INTENSIFIED ON.

DATA: gv_FirstName TYPE NAME1_GP, "We can also use table fields from our custom table like 'ZRK_FirstName data element from master table'.
      gv_LastName TYPE NAME2. "We can also use table fields from our custom table like 'FirstName field from master table'.

gv_FirstName = 'Data Element'.
gv_LastName = 'Table Fields'.

Write: / 'This is a', gv_FirstName COLOR 3 INTENSIFIED ON, 'variable'.
Write: / 'This is', gv_LastName COLOR 3 INTENSIFIED ON, 'variable used from KNA1 table'.

"&---------------------------------------------------------------------*
ULINE.

"A Contanst is unchangable value, once the value is declared. It cannot be changed when assigning a variable. For eg: gv_taxp = 54 is not allowed unlike any other Pre defined variable types.
"A system field is pre defined fields available in SYST SAP table.

WRITE: / 'Constants' COLOR 7 INTENSIFIED Off.

Data: gv_taxq type p DECIMALS 3 VALUE '23'.

CONSTANTS: gc_taxp type p DECIMALS 2 VALUE '43'.

gv_taxq = '56'.
"gc_taxp = '32'

Write: / 'Constants ->', gc_taxp.
Write: / 'Variable ->', gv_taxq.

Write: / 'System fields' COLOR 6 INTENSIFIED Off.

Write: / 'USER NAME ->', sy-uname.
wRITE: / 'Program Title ->', sy-TITLE.
Write: / 'Current Date ->', sy-datum.
Write: / 'Current Time ->', sy-uzeit.