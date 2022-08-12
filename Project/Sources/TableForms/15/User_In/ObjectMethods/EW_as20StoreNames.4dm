If (False:C215)
	//object Name: [USER]User_In.EW_as20StoreNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.EW_as20StoreNames"; Form event code:C388)
Case of 
	: (Self:C308->>0)
		EW_BKAllArrays(DM_al_BKModelIDS{Self:C308->})
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.EW_as20StoreNames"; $_t_oldMethodName)
