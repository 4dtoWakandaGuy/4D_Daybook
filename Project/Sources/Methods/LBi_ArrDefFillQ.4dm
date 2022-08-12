//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_ArrDefFillQ
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(a03Refs)
	//ARRAY TEXT(a01Refs;0)
	//ARRAY TEXT(a02Refs;0)
	//ARRAY TEXT(a04Refs;0)
	//ARRAY TEXT(a05Refs;0)
	//ARRAY TEXT(a06Refs;0)
	C_LONGINT:C283($16; vALLevels)
	C_POINTER:C301($1; $14; $15; $2; $3; $4)
	C_TEXT:C284($_t_LevelReference; $_t_oldMethodName; $10; $11; $12; $13; $5; $6; $7; $8; $9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_ArrDefFillQ")

//NG 20/7/06 This method is a replacement for ALArrDefFillQ
$_t_oldMethodName:=ERR_MethodTracker("LBi_ArrDefFillQ")
//ALArrDefFill
If (Count parameters:C259>=16)
	vALLevels:=$16
	
	$_t_LevelReference:=("0"*Num:C11(vALLevels<10))+String:C10(vALLevels)
	OK:=1
	Case of 
		: (vALLevels=1)
			//LBi_ArrDef01   //Called in Start_Process instead - to save time???
			LBI_AddDef07to99(vALLevels)
			LBI_ArrayDefPic(vALLevels)
			LBI_arrayDefTime(vALLevels)
			LBi_ArrayFillp(1; $1; $2; $3; $4)
			
			//LBi_ArrayFillp ($1;$2;->a01FldP;->a01ArrP;->a01ArrN;->a01Form;->a01Fmul;$3;$4;->a01Refs;$14;$15;->a01Titl;->a01Widt;->a01Ente;->a01Lock;->a01Font;->a01Colo;->a01Foot)
			//The ptrs array numbers are as follows:
			//1=Area variable
			//2=Array of field ptrs
			//3=Array of Array ptrs for columns
			//4=Array of array names for columns
			//5=Now just the Format -
			//   was an Array of concatenated 'formats' for columns
			//    (= Title;Width;Format;Enterable;Locked;Font Size;Colour)
			//6=Array of Formulae
			//7=File ptr to the Included File
			//8=Field/Subfile ptr to the Unique Field/Subfile
			//9=Array of Refs strings:
			//10=File ptr to parent file - the main entry screen
			//11=Field ptr to paretn file's unique field
			//12=Title
			//13=Width
			//14=Enterable
			//15=Locked
			//16=Font Size
			//17=Colour
			//18=Footer no
			LBi_ArrayFillT(->a01Refs; 0; $_t_LevelReference; $5; $6; $7; $8; $9; $10; $11; $12; $13; "")
			//The refs array nos are as follows:
			//1=arrays level
			//2=header colour
			//3=Mod proc
			//4=several params in 1: each character:
			//   1=4 or 2 for Select or Enter
			//   2=0,1 or 2 for Non-resizable, Resizable or Resize needs updating
			//   3=0, 1 or 2 for Locking
			//   4=...for Column dragging
			//   5=...for Definitions
			//   6=...for Column Sorting
			//   7=...for Row Dragging
			//   8/9=...field number of Sort Order field if 7 is valid
			//5=Input layout
			//6=Definitions prefix
			//7=Current definitions reference (changes)
			//8=[File]subfile or blank
			//9=Plural name
			//10=singular name
			//11=place to store the value of the parent's unique field once used
		: (vALLevels=2)
			LBI_AddDef07to99(vALLevels)
			LBI_ArrayDefPic(vALLevels)
			LBI_arrayDefTime(vALLevels)
			LBi_ArrayFillp(2; $1; $2; $3; $4)
			
			//LBi_ArrayFillp ($1;$2;->a02FldP;->a02ArrP;->a02ArrN;->a02Form;->a02Fmul;$3;$4;->a02Refs;$14;$15;->a02Titl;->a02Widt;->a02Ente;->a02Lock;->a02Font;->a02Colo;->a02Foot)
			LBi_ArrayFillT(->a02Refs; 0; $_t_LevelReference; $5; $6; $7; $8; $9; $10; $11; $12; $13; "")
		: (vALLevels=3)
			//LBi_ArrDef03 
			LBI_AddDef07to99(vALLevels)
			LBI_ArrayDefPic(vALLevels)
			LBI_arrayDefTime(vALLevels)
			LBi_ArrayFillp(3; $1; $2; $3; $4)
			
			//LBi_ArrayFillp ($1;$2;->a03FldP;->a03ArrP;->a03ArrN;->a03Form;->a03Fmul;$3;$4;->a03Refs;$14;$15;->a03Titl;->a03Widt;->a03Ente;->a03Lock;->a03Font;->a03Colo;->a03Foot)
			LBi_ArrayFillT(->a03Refs; 0; $_t_LevelReference; $5; $6; $7; $8; $9; $10; $11; $12; $13; "")
		: (vALLevels=4)
			//LBi_ArrDef04 
			LBI_AddDef07to99(vALLevels)
			LBI_ArrayDefPic(vALLevels)
			LBI_arrayDefTime(vALLevels)
			LBi_ArrayFillp(4; $1; $2; $3; $4)
			
			//LBi_ArrayFillp ($1;$2;->a04FldP;->a04ArrP;->a04ArrN;->a04Form;->a04Fmul;$3;$4;->a04Refs;$14;$15;->a04Titl;->a04Widt;->a04Ente;->a04Lock;->a04Font;->a04Colo;->a04Foot)
			LBi_ArrayFillT(->a04Refs; 0; $_t_LevelReference; $5; $6; $7; $8; $9; $10; $11; $12; $13; "")
		: (vALLevels=5)
			//LBi_ArrDef05 
			LBI_AddDef07to99(vALLevels)
			LBI_ArrayDefPic(vALLevels)
			LBI_arrayDefTime(vALLevels)
			LBi_ArrayFillp(5; $1; $2; $3; $4)
			
			//LBi_ArrayFillp ($1;$2;->a05FldP;->a05ArrP;->a05ArrN;->a05Form;->a05Fmul;$3;$4;->a05Refs;$14;$15;->a05Titl;->a05Widt;->a05Ente;->a05Lock;->a05Font;->a05Colo;->a05Foot)
			LBi_ArrayFillT(->a05Refs; 0; $_t_LevelReference; $5; $6; $7; $8; $9; $10; $11; $12; $13; "")
		: (vALLevels=6)
			//LBi_ArrDef06 
			LBI_AddDef07to99(vALLevels)
			LBI_ArrayDefPic(vALLevels)
			LBI_arrayDefTime(vALLevels)
			LBi_ArrayFillp(6; $1; $2; $3; $4)
			
			//LBi_ArrayFillp ($1;$2;->a06FldP;->a06ArrP;->a06ArrN;->a06Form;->a06Fmul;$3;$4;->a06Refs;$14;$15;->a06Titl;->a06Widt;->a06Ente;->a06Lock;->a06Font;->a06Colo;->a06Foot)
			LBi_ArrayFillT(->a06Refs; 0; $_t_LevelReference; $5; $6; $7; $8; $9; $10; $11; $12; $13; "")
		Else 
			BEEP:C151
			Gen_Alert("The Included Area could not be drawn(2)")
			OK:=0
	End case 
End if 
ERR_MethodTrackerReturn("LBi_ArrDefFillQ"; $_t_oldMethodName)