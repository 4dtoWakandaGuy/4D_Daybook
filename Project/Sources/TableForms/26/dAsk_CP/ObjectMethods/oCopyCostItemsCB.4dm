If (False:C215)
	//object Name: [JOBS]dask_CP.Variable4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2009 21:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(r1; r2; s1; s2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].dask_CP.Variable4"; Form event code:C388)
If ((r2=1) | (r1=1))
	If ((DB_GetModuleSettingByNUM(1))#5)
		
		OBJECT SET ENABLED:C1123(s1; True:C214)
	End if 
	
	OBJECT SET ENABLED:C1123(s2; True:C214)
Else 
	
	OBJECT SET ENABLED:C1123(s1; False:C215)
	OBJECT SET ENABLED:C1123(s2; False:C215)
End if 
ERR_MethodTrackerReturn("OBJ [JOBS].dask_CP.Variable4"; $_t_oldMethodName)
