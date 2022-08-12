If (False:C215)
	//object Name: [USER]User_In.obSelectLocalPath
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/02/2010 19:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_BackupPath; $_t_LocalBackupPath; $_t_oldMethodName; BP_t_LocalBackupPath)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.obSelectLocalPath"; Form event code:C388)
If (Application type:C494=4D Remote mode:K5:5)
	Gen_Confirm("Are you  ready to launch select path dialog on server? "+"You must go to server physically if you press OK")
	If (OK=1)
		$_t_BackupPath:=DB_GetPathFromServer("Please select the 4D backup path")
		
		If ($_t_BackupPath#"") & ($_t_BackupPath#"Cancelled")
			BP_t_LocalBackupPath:=$_t_BackupPath
		End if 
		
	End if 
	
Else 
	$_t_LocalBackupPath:=DB_SelectFolder("Please select the local backup path")
	If ($_t_LocalBackupPath#"")
		BP_t_LocalBackupPath:=$_t_LocalBackupPath
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:User_In,bSelectLocalPath"; $_t_oldMethodName)
