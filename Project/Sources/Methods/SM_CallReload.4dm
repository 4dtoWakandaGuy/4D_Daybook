//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_CallReload
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
	ARRAY LONGINT:C221($_al_ListProcs; 0)
	ARRAY TEXT:C222($_at_ClientList; 0)
	C_LONGINT:C283($_l_ClientIndex; $_l_Number)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_CallReload")
Case of 
	: (Application type:C494=4D Server:K5:6)
		//If (Count parameters=1)
		
		ARRAY TEXT:C222($_at_ClientList; 0)
		ARRAY LONGINT:C221($_al_ListProcs; 0)
		GET REGISTERED CLIENTS:C650($_at_ClientList; $_al_ListProcs)
		
		For ($_l_ClientIndex; 1; Size of array:C274($_at_ClientList))
			GET REGISTERED CLIENTS:C650($_at_ClientList; $_al_ListProcs)
			If ($_l_ClientIndex<=Size of array:C274($_at_ClientList))
				$_l_Number:=-2  //bsw/ng
				EXECUTE ON CLIENT:C651($_at_ClientList{$_l_ClientIndex}; "SM_SetReload"; $_l_Number)
			End if 
		End for 
		//End if
End case 
ERR_MethodTrackerReturn("SM_CallReload"; $_t_oldMethodName)
