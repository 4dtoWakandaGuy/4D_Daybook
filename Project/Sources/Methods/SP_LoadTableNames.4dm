//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_LoadTableNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2009 12:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SP_al_RealTableNums;0)
	//ARRAY TEXT(SP_at_RealTableNames;0)
	C_LONGINT:C283($_l_TableIndex)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_LoadTableNames")
//this method simply loads all the table names and their table numbers
ARRAY TEXT:C222(SP_at_RealTableNames; Get last table number:C254)
ARRAY LONGINT:C221(SP_al_RealTableNums; Get last table number:C254)
For ($_l_TableIndex; 1; Get last table number:C254)
	If (Is table number valid:C999($_l_TableIndex))
		
		SP_at_RealTableNames{$_l_TableIndex}:=Table name:C256($_l_TableIndex)
		SP_al_RealTableNums{$_l_TableIndex}:=$_l_TableIndex
	End if 
End for 
ERR_MethodTrackerReturn("SP_LoadTableNames"; $_t_oldMethodName)
