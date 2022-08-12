If (False:C215)
	//object Name: [USER]User_In.Variable78
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/01/2012 19:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Process; $_l_Retries; DOC_l_RetreivedDocument)
	C_TEXT:C284($_t_DocumentPath; $_t_oldMethodName; Cat_T_PicturePath; DOC_t_RetreivedDocumentpath)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Variable78"; Form event code:C388)
If (Application type:C494=4D Remote mode:K5:5)  // 18/10/03 pb
	CONFIRM:C162("A path selection dialogue will appear on the server.")
	If (OK=1)
		$_t_DocumentPath:=""
		$_l_Process:=Execute on server:C373("SelectFolderOnServer"; 64000; "SelectFolder"; Current process:C322)
		$_l_Retries:=0
		
		While ($_t_DocumentPath="")
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*$_l_Retries)
			GET PROCESS VARIABLE:C371($_l_Process; DOC_t_RetreivedDocumentpath; $_t_DocumentPath)
			If ($_t_DocumentPath#"")
				SET PROCESS VARIABLE:C370($_l_Process; DOC_l_RetreivedDocument; 1)
			End if 
		End while 
		If ($_t_DocumentPath#"stop") & ($_t_DocumentPath#"")
			Cat_T_PicturePath:=$_t_DocumentPath
		End if 
	End if 
Else 
	Gen_Alert("Remember this path must be applicable to all users!")
	Cat_T_PicturePath:=DB_SelectFolder("Select directory to contain images:")
End if 
ERR_MethodTrackerReturn("OBJ:User_In,B_ModPath"; $_t_oldMethodName)
