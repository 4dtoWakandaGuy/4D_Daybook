//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_ArrDefFill01
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
	//ARRAY TEXT(a01Refs;0)
	C_LONGINT:C283(vALLevels)
	C_POINTER:C301($1; $14; $15; $2; $3; $4)
	C_TEXT:C284($_t_LevelReference; $_t_oldMethodName; $10; $11; $12; $13; $5; $6; $7; $8; $9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_ArrDefFill01")

//NG 20/7/06 This method is a replacement for ALArrDefFill01
$_t_oldMethodName:=ERR_MethodTracker("LBi_ArrDefFill01")
If (Count parameters:C259>=13)
	LBi_ArrayFillp(1; $1; $2; $3; $4)
	
	//LBi_ArrayFillp ($1;$2;->a01FldP;->a01ArrP;->a01ArrN;->a01Form;->a01Fmul;$3;$4;->a01Refs;$14;$15;->a01Titl;->a01Widt;->a01Ente;->a01Lock;->a01Font;->a01Colo;->a01Foot)
	vALLevels:=1
	$_t_LevelReference:=("0"*Num:C11(vALLevels<10))+String:C10(vALLevels)
	ARRAY TEXT:C222(a01Refs; 0)
	LBi_ArrayFillT(->a01Refs; 0; $_t_LevelReference; $5; $6; $7; $8; $9; $10; $11; $12; $13; "")
End if 
ERR_MethodTrackerReturn("LBi_ArrDefFill01"; $_t_oldMethodName)