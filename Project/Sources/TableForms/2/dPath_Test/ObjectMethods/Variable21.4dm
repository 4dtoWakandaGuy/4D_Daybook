If (False:C215)
	//object Name: [COMPANIES]dPath_Test.Variable21
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ReadOnlyState)
	C_TEXT:C284($_t_oldMethodName; vTitle1)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dPath_Test.Variable21"; Form event code:C388)
$_bo_ReadOnlyState:=Read only state:C362([USER:15])
If ($_bo_ReadOnlyState=True:C214)
	READ WRITE:C146([USER:15])
	LOAD RECORD:C52([USER:15])
End if 
vTitle1:=Uppers2(vTitle1)
[USER:15]Name:38:=vTitle1
ERR_MethodTrackerReturn("OBJ [COMPANIES].dPath_Test.Variable21"; $_t_oldMethodName)
