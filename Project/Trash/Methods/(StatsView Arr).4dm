//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StatsView Arr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(aSV2;0)
	//ARRAY REAL(aSV3;0)
	//ARRAY REAL(aSV4;0)
	//ARRAY TEXT(aSV1;0)
	//ARRAY TEXT(aSVN1;0)
	C_LONGINT:C283($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView Arr")
Case of 
	: ($2=0)
		ARRAY TEXT:C222(aSV1; $1)  //NG november 2004
		
		ARRAY TEXT:C222(aSVN1; $1)
		ARRAY LONGINT:C221(aSV2; $1)
		ARRAY REAL:C219(aSV3; $1)
		ARRAY REAL:C219(aSV4; $1)
	: ($2=1)
		INSERT IN ARRAY:C227(aSV1; $1; 1)
		INSERT IN ARRAY:C227(aSVN1; $1; 1)
		INSERT IN ARRAY:C227(aSV2; $1; 1)
		INSERT IN ARRAY:C227(aSV3; $1; 1)
		INSERT IN ARRAY:C227(aSV4; $1; 1)
	: ($2=2)
		DELETE FROM ARRAY:C228(aSV1; $1; 1)
		DELETE FROM ARRAY:C228(aSVN1; $1; 1)
		DELETE FROM ARRAY:C228(aSV2; $1; 1)
		DELETE FROM ARRAY:C228(aSV3; $1; 1)
		DELETE FROM ARRAY:C228(aSV4; $1; 1)
End case 
ERR_MethodTrackerReturn("StatsView Arr"; $_t_oldMethodName)