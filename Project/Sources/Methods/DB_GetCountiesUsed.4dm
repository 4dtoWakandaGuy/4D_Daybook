//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetCountiesUsed
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  07/01/2011 12:52 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Counties; 0)
	//ARRAY TEXT(DB_at_CountyNames;0)
	C_BOOLEAN:C305(DB_bo_CountiesReady)
	C_LONGINT:C283($_l_BlankRow; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetCountiesUsed")
If (Count parameters:C259>=1)
	
	READ ONLY:C145([COMPANIES:2])
	
	ALL RECORDS:C47([COMPANIES:2])
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
	
	DISTINCT VALUES:C339([COMPANIES:2]County_or_State:6; $_at_Counties)
	$_l_BlankRow:=Find in array:C230($_at_Counties; "")
	If ($_l_BlankRow>0)
		DELETE FROM ARRAY:C228($_at_Counties; $_l_BlankRow)
	End if 
	VARIABLE TO VARIABLE:C635($1; DB_at_CountyNames; $_at_Counties)
	
	SET PROCESS VARIABLE:C370($1; DB_bo_CountiesReady; True:C214)
	
End if 
ERR_MethodTrackerReturn("DB_GetCountiesUsed"; $_t_oldMethodName)