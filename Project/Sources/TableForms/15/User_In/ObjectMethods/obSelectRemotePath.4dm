If (False:C215)
	//object Name: [USER]User_In.obSelectRemotePath
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
	C_TEXT:C284($_t_LocalPath; $_t_oldMethodName; $_t_RemoteBackupPath; BP_t_RemoteBackupPath)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.obSelectRemotePath"; Form event code:C388)
If (Application type:C494=4D Remote mode:K5:5)
	
	Gen_Confirm("Are you  ready to launch select path dialog on server? "+"You must go to server physically if you press OK")
	If (OK=1)
		$_t_RemoteBackupPath:=DB_GetPathFromServer("Please select the  path to the directory to copy the backup to")
		
		If ($_t_RemoteBackupPath#"") & ($_t_RemoteBackupPath#"Cancelled")
			BP_t_RemoteBackupPath:=$_t_RemoteBackupPath
		End if 
		
	End if 
	
	
Else 
	$_t_RemoteBackupPath:=DB_SelectFolder("Please select the remote backup path")
	If ($_t_RemoteBackupPath#"")
		BP_t_RemoteBackupPath:=$_t_RemoteBackupPath
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:User_In,bSelectRemotePath"; $_t_oldMethodName)
