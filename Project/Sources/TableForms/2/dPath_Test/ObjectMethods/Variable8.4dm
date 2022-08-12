If (False:C215)
	//object Name: [COMPANIES]dPath_Test.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ReadOnlyState; LR_bo_isLicenced)
	C_DATE:C307(LR_D_LastLicenceDate)
	C_TEXT:C284(<>PathName; $_t_oldMethodName; Vtitle2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dPath_Test.Variable8"; Form event code:C388)
Path_Check(True:C214)
If (LR_bo_isLicenced)
	$_bo_ReadOnlyState:=Read only state:C362([USER:15])
	If ($_bo_ReadOnlyState=True:C214)
		READ WRITE:C146([USER:15])
		LOAD RECORD:C52([USER:15])
	End if 
	[USER:15]Path Name:12:=<>PathName  //NG still write this even though redundant(it is decoded in the licenc check
	[USER:15]Limit Date:58:=LR_D_LastLicenceDate
	[USER:15]Organisation:1:=Vtitle2
	ACCEPT:C269
Else 
	Gen_Alert("The licence is not accepted")
	GOTO OBJECT:C206(Vtitle2)
	
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dPath_Test.Variable8"; $_t_oldMethodName)
