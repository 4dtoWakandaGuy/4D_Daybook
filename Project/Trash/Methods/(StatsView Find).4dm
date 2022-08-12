//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StatsView Find
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DB_at_TableName;0)
	//ARRAY TEXT(SV_at_TableFindCodes;0)
	C_LONGINT:C283(bd11)
	C_POINTER:C301($_Ptr_Table; vFilePtr)
	C_TEXT:C284($_t_oldMethodName; $_t_oldMethodName2; vSelPrev)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("StatsView Find")

//StatsView Find
If ((DB_at_TableName#1) & (SV_at_TableFindCodes{DB_at_TableName}#"") & (bd11=1))
	CUT NAMED SELECTION:C334(vFilePtr->; "Select")
	vSelPrev:=""
	$_Ptr_Table:=vFilePtr
	$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+SV_at_TableFindCodes{DB_at_TableName})
	EXECUTE FORMULA:C63(SV_at_TableFindCodes{DB_at_TableName})
	If (OK=1)
		CREATE SET:C116(vfilePtr->; "Master")
	Else 
		bd11:=0
	End if 
	vFilePtr:=$_Ptr_Table
	USE NAMED SELECTION:C332("Select")
End if 
ERR_MethodTrackerReturn("StatsView Find"; $_t_oldMethodName)
