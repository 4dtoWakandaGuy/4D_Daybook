If (False:C215)
	//object Name: [CATALOGUE]Catalogue_Input.Variable3
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
	C_TEXT:C284($_t_oldMethodName; $_t_Path; DOC_t_RetreivedDocumentpath)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CATALOGUE].Catalogue_Input.Variable3"; Form event code:C388)
If (Application type:C494=4D Remote mode:K5:5)  // 18/10/03 pb
	CONFIRM:C162("A path selection dialogue will appear on the server.")
	If (OK=1)
		$_t_Path:=""
		$_l_Process:=Execute on server:C373("SelectFolderOnServer"; 64000; "SelectFolder"; Current process:C322)
		$_l_Retries:=0
		While ($_t_Path="")
			$_l_Retries:=$_l_Retries+1
			DelayTicks($_l_Retries*2)
			If ($_l_Retries>30)
				$_l_Retries:=30
			End if 
			GET PROCESS VARIABLE:C371($_l_Process; DOC_t_RetreivedDocumentpath; $_t_Path)
			If ($_t_Path#"")
				SET PROCESS VARIABLE:C370($_l_Process; DOC_l_RetreivedDocument; 1)
			End if 
		End while 
		If ($_t_Path#"stop") & ($_t_Path#"")
			[CATALOGUE:108]Image_Path:4:=$_t_Path
		End if 
	End if 
Else 
	Gen_Alert("Remember this path must be applicable to all users!")
	[CATALOGUE:108]Image_Path:4:=DB_SelectFolder("Select directory containing images:")
End if 
ERR_MethodTrackerReturn("OBJ:Catalogue_Input,B_ModPath"; $_t_oldMethodName)
