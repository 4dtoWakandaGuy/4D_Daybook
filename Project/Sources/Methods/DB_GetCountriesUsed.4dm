//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetCountriesUsed
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  07/01/2011 12:15 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Countries; 0)
	//ARRAY TEXT(DB_at_CountryNames;0)
	C_BOOLEAN:C305(LAY_bo_CountriesReady)
	C_LONGINT:C283($_l_BlankRow; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetCountriesUsed")
If (Count parameters:C259>=1)
	
	READ ONLY:C145([COMPANIES:2])
	
	ALL RECORDS:C47([COMPANIES:2])
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
	
	DISTINCT VALUES:C339([COMPANIES:2]Country:8; $_at_Countries)
	$_l_BlankRow:=Find in array:C230($_at_Countries; "")
	If ($_l_BlankRow>0)
		DELETE FROM ARRAY:C228($_at_Countries; $_l_BlankRow)
	End if 
	VARIABLE TO VARIABLE:C635($1; DB_at_CountryNames; $_at_Countries)
	
	SET PROCESS VARIABLE:C370($1; LAY_bo_CountriesReady; True:C214)
	
End if 
ERR_MethodTrackerReturn("DB_GetCountriesUsed"; $_t_oldMethodName)