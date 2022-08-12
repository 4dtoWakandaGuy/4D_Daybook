//%attributes = {}
If (False:C215)
	//Project Method Name:      INIT_BashWrapper
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
	ARRAY TEXT:C222($_at_HFSDirectories; 0)
	C_BOOLEAN:C305(<>Err_bo_ManualHandler; $_bo_Error; $_bo_IsWindows)
	C_LONGINT:C283(<>Err_l_NoError; $_l_Application_type; $_l_Index; $_l_SizeofArray)
	C_TEXT:C284($_t_CurrentActiveDirectory; $_t_DestinationFolderPath; Folder separator:K24:12; $_t_EnvFolder; $_t_File; $_t_LocalCachePath; $_t_oldMethodName; $_t_PathName; $_t_PathNEW; $_t_PathOLD; $_t_StructurePath)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INIT_BashWrapper")
//WORKAROUND_BASHiitFix

$_l_Application_type:=Application type:C494
If ($_l_Application_type=4)
	
	
	$_bo_IsWindows:=Is Windows:C1573
	
	
	//Folder separator:=DB_DirSymbol 
	Case of 
		: ($_bo_IsWindows)
			$_t_EnvFolder:="win4dx"
			
			
		Else 
			$_t_EnvFolder:="mac4dx"
	End case 
	
	$_t_LocalCachePath:=Get 4D folder:C485(4D Client database folder:K5:13)
	
	$_t_CurrentActiveDirectory:=Get 4D folder:C485
	
	$_t_StructurePath:=StructureFilePath
	
	$_t_CurrentActiveDirectory:=$_t_CurrentActiveDirectory+$_t_StructurePath
	
	
	$_bo_Error:=False:C215
	
	Case of 
		: (Test path name:C476($_t_CurrentActiveDirectory)=-43)
			
			CREATE FOLDER:C475($_t_CurrentActiveDirectory)
			
		: (Test path name:C476($_t_CurrentActiveDirectory)=0)
			
		Else 
			$_bo_Error:=True:C214
	End case 
	
	If (Not:C34($_bo_Error))
		
		$_t_DestinationFolderPath:=$_t_CurrentActiveDirectory+Folder separator:K24:12+$_t_EnvFolder
		
		Case of 
			: (Test path name:C476($_t_DestinationFolderPath)=-43)
				CREATE FOLDER:C475($_t_DestinationFolderPath)
				
			: (Test path name:C476($_t_DestinationFolderPath)=0)
			Else 
				$_bo_Error:=True:C214
		End case 
		
		
		If (Not:C34($_bo_Error))
			
			$_t_PathName:=$_t_LocalCachePath+$_t_EnvFolder
			ARRAY TEXT:C222($_at_HFSDirectories; 0)
			DOCUMENT LIST:C474($_t_PathName; $_at_HFSDirectories)
			
			$_l_SizeofArray:=Size of array:C274($_at_HFSDirectories)
			For ($_l_Index; 1; $_l_SizeofArray)
				
				$_t_File:=$_at_HFSDirectories{$_l_Index}
				
				$_t_PathOLD:=$_t_PathName+Folder separator:K24:12+$_t_File
				
				$_t_PathNEW:=$_t_DestinationFolderPath+Folder separator:K24:12+$_t_File
				If (Test path name:C476($_t_PathNEW)#Is a document:K24:1)
					COPY DOCUMENT:C541($_t_PathOLD; $_t_PathNEW; *)
				End if 
				
			End for 
			
		End if 
		
	End if 
	
	If ($_bo_Error)
		Gen_Alert("Folder cannot be created")
	End if 
	
End if   //If (ENV_Is4DClient_D )
// Just here we are getting a problem from Bash. it seems to be trying to open a resource file that is not there. As this is datafile dependant i have conculded that it is trying to open the resource for of the data file
//and if the data file was a mac combined and has been split it has a resource fork as well as the .4DR it cannot open ther resource fork of the datafile and gets a -49 error
<>Err_l_NoError:=-49  //will stop the Error_Proc
//INIT_BASh  AUGUST 2009 Bash out
<>Err_l_NoError:=-0  //don't report this error to the user
<>Err_bo_ManualHandler:=False:C215
//End method
ERR_MethodTrackerReturn("INIT_BashWrapper"; $_t_oldMethodName)