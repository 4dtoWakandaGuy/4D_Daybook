//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_GetreportsFolder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_PathType)
	C_TEXT:C284($_t_CurrentActiveDirectory2; Folder separator:K24:12; $_t_DocumentName; $_t_NewPath; $_t_oldMethodName; $_t_StructurePluginsPath; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_GetreportsFolder")

$0:=""
//Folder separator:=DB_DirSymbol 

$_t_CurrentActiveDirectory2:=Get 4D folder:C485
$_t_StructurePluginsPath:=StructureFilePath("PLUGINS")
$_t_DocumentName:=DocNameFromPath($_t_StructurePluginsPath)

Case of   //C
	: (Application type:C494=4)  //4D Client`C
		$_t_NewPath:=PathFromPathName($_t_StructurePluginsPath)
		//check folder
		$_t_NewPath:=$_t_CurrentActiveDirectory2+$_t_DocumentName
		$_l_PathType:=Test path name:C476($_t_NewPath)
		Case of   //D
			: ($_l_PathType=0)  //D
				//this is the folder
				//now find the mac4dx or wind4dx
				Case of   //E
					: (Is Windows:C1573)  //E
						$_t_NewPath:=$_t_NewPath+Folder separator:K24:12+"WIN4DX"
					Else   //E
						$_t_NewPath:=$_t_NewPath+Folder separator:K24:12+"MAC4DX"
				End case   //E
				$_l_PathType:=Test path name:C476($_t_NewPath)
				Case of   //F
					: ($_l_PathType=0)  //F
						//this is the folder
						$_t_NewPath:=$_t_NewPath+Folder separator:K24:12+"QuickReports"
						$_l_PathType:=Test path name:C476($_t_NewPath)
						Case of   //G
							: ($_l_PathType=0)  //G
								$_bo_OK:=True:C214
							Else 
								//its not there so create it
								$_bo_OK:=False:C215
								CREATE FOLDER:C475($_t_NewPath)
								$_l_PathType:=Test path name:C476($_t_NewPath)
								If ($_l_PathType=0)  //H
									$_bo_OK:=True:C214
								Else   //H
									//TRACE
								End if   //END H
						End case   //END G
						
						If ($_bo_OK=True:C214)  //i
							$0:=$_t_NewPath
							
							//the folder is there but is the QR
						End if   //END i
						
						//
					: ($_l_PathType=1)  //F
						//error
					Else   // F
						//its not there!!
						
				End case   // END F
				
			: ($_l_PathType=1)  //D
			Else   //3 continue`D
				//its not there so create it!
		End case   //end D
		
	: (Application type:C494<4)  //C
		
		
		$_t_NewPath:=PathFromPathName($_t_StructurePluginsPath)
		//this is the folder
		//now find the mac4dx or wind4dx
		Case of   //M
			: (Is Windows:C1573)
				$_t_NewPath:=$_t_NewPath+"WIN4DX"
			Else   //M
				$_t_NewPath:=$_t_NewPath+"MAC4DX"
		End case   //END M
		$_l_PathType:=Test path name:C476($_t_NewPath)
		Case of   //n
			: ($_l_PathType=0)  //N
				//this is the folder
				$_t_NewPath:=$_t_NewPath+Folder separator:K24:12+"QuickReports"
				$_l_PathType:=Test path name:C476($_t_NewPath)
				Case of   //P
					: ($_l_PathType=0)  //P
						$_bo_OK:=True:C214
					Else   //P
						//its not there so create it
						$_bo_OK:=False:C215
						CREATE FOLDER:C475($_t_NewPath)
						$_l_PathType:=Test path name:C476($_t_NewPath)
						If ($_l_PathType=0)  //Q
							$_bo_OK:=True:C214
						Else   //Q
							//TRACE
						End if   //END Q
				End case   //end  P
				If ($_bo_OK=True:C214)  //R
					//the folder is there but is the QR
					$0:=$_t_NewPath
				End if   //ENd R
				
			: ($_l_PathType=1)  //N
				//error
			Else   // N
				//its not there!!
				
		End case   //End N
		
		
		
End case   //2 end
ERR_MethodTrackerReturn("SP_GetreportsFolder"; $_t_oldMethodName)