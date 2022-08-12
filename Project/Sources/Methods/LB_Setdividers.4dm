//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_Setdividers
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
	C_LONGINT:C283($2; $3)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_Setdividers")
//The method will mimic (Sort of) AL_Set dividers
//AL_SetDividers (AreaName;ColDividerPattern;ColDividerColor1;ColDividerColor2;RowDividerPattern;RowDividerColor1;RowDividerColor2)

//SHOW LISTBOX GRID($1->;False;False)
Case of 
	: ($3=0)  // Grid off
		LISTBOX SET GRID:C841($1->; False:C215; False:C215)
	: ($3=1)  // Vertical on horizontal off
		LISTBOX SET GRID:C841($1->; True:C214; False:C215)
	: ($3=2)  // Vertical on horizontal off
		LISTBOX SET GRID:C841($1->; False:C215; True:C214)
	: ($3=4)  // both on
		LISTBOX SET GRID:C841($1->; True:C214; True:C214)
		
	: ($3=8)  // Vertical only
		
		LISTBOX SET GRID COLOR:C842($1->; $2; False:C215; True:C214)
	: ($3=16)  // Horizontal  only
		LISTBOX SET GRID COLOR:C842($1->; $2; True:C214; False:C215)
	: ($3=32)  // Horizontal and vertical
		LISTBOX SET GRID COLOR:C842($1->; $2; True:C214; True:C214)
End case 
ERR_MethodTrackerReturn("LB_Setdividers"; $_t_oldMethodName)