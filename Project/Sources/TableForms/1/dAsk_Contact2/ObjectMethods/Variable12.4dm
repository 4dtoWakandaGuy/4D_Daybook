If (False:C215)
	//object Name: [CONTACTS]dask_Contact2.Variable12
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_TEXT:C284($_t_oldMethodName; vContact)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dask_Contact2.Variable12"; Form event code:C388)
vContact:=SVS_at_PreviewEvent{GEN_at_Identity}
ERR_MethodTrackerReturn("OBJ [CONTACTS].dask_Contact2.Variable12"; $_t_oldMethodName)
