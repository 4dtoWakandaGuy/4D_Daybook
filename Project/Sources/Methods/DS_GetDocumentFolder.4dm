//%attributes = {}
If (False:C215)
	//Project Method Name:      DS_GetDocumentFolder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:55
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_Platform; $_l_TestPathType)
	C_TEXT:C284($_t_CurrentActiveDirectory; $_t_DatabaseName; Folder separator:K24:12; $_t_NewPath; $_t_oldMethodName; $_t_StructurePath; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DS_GetDocumentFolder")
//this will get the path to the folder
$_l_Platform:=0

//Folder separator:=DB_DirSymbol 

$_t_CurrentActiveDirectory:=Get 4D folder:C485
$_t_StructurePath:=StructureFilePath
$_t_DatabaseName:=DocNameFromPath($_t_StructurePath)


Case of   //C
	: (Application type:C494=4)  //4D Client`C
		$_t_NewPath:=DB_GetDocumentPath
		//$_t_NewPath:=PathFromPathName ($_t_CurrentActiveDirectory)
		//check folder
		$_t_NewPath:=$_t_NewPath+$_t_DatabaseName
		$_l_TestPathType:=Test path name:C476($_t_NewPath+Folder separator:K24:12)
		Case of   //D
			: ($_l_TestPathType=0)  //D
				
				Case of   //E
					: (Is macOS:C1572)  //E
						$_t_NewPath:=$_t_NewPath+Folder separator:K24:12+"DOCS"
					Else   //E
						$_t_NewPath:=$_t_NewPath+Folder separator:K24:12+"DOCS"
				End case   //E
				$_l_TestPathType:=Test path name:C476($_t_NewPath)
				Case of   //F
					: ($_l_TestPathType=0)  //F
						//this is the folder
						//$_t_NewPath:=$_t_NewPath+Folder separator  `+$1
						$_l_TestPathType:=Test path name:C476($_t_NewPath)
						Case of   //G
							: ($_l_TestPathType=0)  //G
								$_bo_OK:=True:C214
							Else 
								//its not there so create it
								$_bo_OK:=False:C215
								CREATE FOLDER:C475($_t_NewPath)
								$_l_TestPathType:=Test path name:C476($_t_NewPath)
								If ($_l_TestPathType=0)  //H
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
					: ($_l_TestPathType=1)  //F
						//error
					: ($_l_TestPathType=-43)  //F
						CREATE FOLDER:C475($_t_NewPath)
						$_bo_OK:=True:C214
					Else   // F
						//its not there!!
						
				End case   // END F
				
				If ($_bo_OK)
					$0:=$_t_NewPath
				End if 
				
			: ($_l_TestPathType=1)  //D
			Else   //3 continue`D
				CREATE FOLDER:C475($_t_NewPath+Folder separator:K24:12)
				//its not there so create it!
				Case of   //E
					: ($_l_Platform=3)  //E
						$_t_NewPath:=$_t_NewPath+Folder separator:K24:12+"DOCS"
					Else   //E
						$_t_NewPath:=$_t_NewPath+Folder separator:K24:12+"DOCS"
				End case   //E
				$_l_TestPathType:=Test path name:C476($_t_NewPath)
				Case of   //F
					: ($_l_TestPathType=0)  //F
						//this is the folder
						//$_t_NewPath:=$_t_NewPath+Folder separator  `+$1
						$_l_TestPathType:=Test path name:C476($_t_NewPath)
						Case of   //G
							: ($_l_TestPathType=0)  //G
								$_bo_OK:=True:C214
							Else 
								//its not there so create it
								$_bo_OK:=False:C215
								CREATE FOLDER:C475($_t_NewPath)
								$_l_TestPathType:=Test path name:C476($_t_NewPath)
								If ($_l_TestPathType=0)  //H
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
					: ($_l_TestPathType=1)  //F
						//error
					: ($_l_TestPathType=-43)  //F
						CREATE FOLDER:C475($_t_NewPath)
						$_bo_OK:=True:C214
					Else   // F
						//its not there!!
						
				End case   // END F
				
				If ($_bo_OK)
					$0:=$_t_NewPath
				End if 
				
		End case   //end D
		
	: (Application type:C494<4)  //C
		
		
		$_t_NewPath:=PathFromPathName($_t_StructurePath)
		//this is the folder
		//now find the mac4dx or wind4dx
		Case of   //M
			: ($_l_Platform=3)
				$_t_NewPath:=$_t_NewPath+"DOCS"
			Else   //M
				$_t_NewPath:=$_t_NewPath+"DOCS"
		End case   //END M
		$_l_TestPathType:=Test path name:C476($_t_NewPath)
		Case of   //n
			: ($_l_TestPathType=0)  //N
				//this is the folder
				$_t_NewPath:=$_t_NewPath+Folder separator:K24:12+$1
				$_l_TestPathType:=Test path name:C476($_t_NewPath)
				Case of   //P
					: ($_l_TestPathType=0)  //P
						$_bo_OK:=True:C214
					Else   //P
						//its not there so create it
						$_bo_OK:=False:C215
						CREATE FOLDER:C475($_t_NewPath)
						$_l_TestPathType:=Test path name:C476($_t_NewPath)
						If ($_l_TestPathType=0)  //Q
							$_bo_OK:=True:C214
						Else   //Q
							//TRACE
						End if   //END Q
				End case   //end  P
				If ($_bo_OK=True:C214)  //R
					//the folder is there but is the QR
					$0:=$_t_NewPath
				End if   //ENd R
				
			: ($_l_TestPathType=1)  //N
				//error
				
			: ($_l_TestPathType=-43)
				CREATE FOLDER:C475($_t_NewPath)
			Else   // N
				//its not there!!
				
		End case   //End N
		
		
End case   //2 end
ERR_MethodTrackerReturn("DS_GetDocumentFolder"; $_t_oldMethodName)