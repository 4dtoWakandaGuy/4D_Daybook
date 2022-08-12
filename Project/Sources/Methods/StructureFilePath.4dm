//%attributes = {}
If (False:C215)
	//Project Method Name:      StructureFilePath
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_DocumentPaths; 0)
	C_LONGINT:C283($_l_ApplicationType; $_l_Index)
	C_TEXT:C284($_t_ApplicationPath; $_t_oldMethodName; $_t_PathOption; $_t_StructurePath; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StructureFilePath")


If (Count parameters:C259>=1)
	$_t_PathOption:=$1
End if 
$_Obj_appPath:=Path to object:C1547(Application file:C491)
$_t_ApplicationPath:=""
If (Not:C34($_Obj_appPath.parentFolder=Null:C1517))
	
	$_t_ApplicationPath:=$_Obj_appPath.parentFolder
End if 
$_l_ApplicationType:=Application type:C494
$_t_StructurePath:=""

Case of 
	: ($_t_ApplicationPath#"")
		$_t_StructurePath:=$_t_ApplicationPath
		Case of 
			: ($_t_PathOption="plugins")
				$_t_StructurePath:=$_t_ApplicationPath+Folder separator:K24:12+"Contents"+Folder separator:K24:12
				
		End case 
		
	: (($_l_ApplicationType=4D Volume desktop:K5:2) & (Is macOS:C1572))
		
		$_t_ApplicationPath:=Application file:C491
		If (Count parameters:C259=0)
			If (Test path name:C476($_t_ApplicationPath)=Is a folder:K24:2)
				$_t_ApplicationPath:=$_t_ApplicationPath+Folder separator:K24:12+"Contents:Database"
				If (Test path name:C476($_t_ApplicationPath)=Is a folder:K24:2)
					DOCUMENT LIST:C474($_t_ApplicationPath; $_at_DocumentPaths)
					$_l_Index:=1
					While (($_l_Index<=Size of array:C274($_at_DocumentPaths)) & (Test path name:C476($_t_StructurePath)#Is a document:K24:1))
						If ($_at_DocumentPaths{$_l_Index}="@.4DC")
							$_t_StructurePath:=$_t_ApplicationPath+Folder separator:K24:12+$_at_DocumentPaths{$_l_Index}
						End if 
						$_l_Index:=$_l_Index+1
					End while 
				End if 
			End if 
		Else 
			
			//**********************************************************************************************************************
			//v631b120h_7 & v631b120p -07/04/09 -KMW. Added missing directory seperator symbol.
			//As far as i can tell, at time of writing "StructureFilePath" is only called by two methods...
			//... both of which if they pass a parameter only ever pass "PLUGINS", and both...
			//...of which in this situation seem to expect a speratror at the end of the path (and/or look like they require it)...
			
			Case of 
				: ($_t_PathOption="RSR") | ($_t_PathOption="MAC4DX")
					//Return the path to the .RSR file
					//$_t_StructurePath:=$_t_ApplicationPath+":Contents:Database"
					$_t_StructurePath:=$_t_ApplicationPath+Folder separator:K24:12+"Contents"+Folder separator:K24:12+"Database"+Folder separator:K24:12  //Added seperator, v631b120h_7 -07/04/09 -KMW
					
				: ($_t_PathOption="PLUGINS")
					//return the path to the plugs in folder
					//$_t_StructurePath:=$_t_ApplicationPath+":Contents"
					$_t_StructurePath:=$_t_ApplicationPath+Folder separator:K24:12+"Contents"+Folder separator:K24:12  //Added seperator, v631b120h_7 -07/04/09 -KMW
					
			End case 
			//**********************************************************************************************************************
			
		End if 
	: ($_l_ApplicationType=4D Volume desktop:K5:2)
		//PC Runtime volume engined-make sure this stays underneath the mac version
		$_t_ApplicationPath:=Application file:C491
		If (Count parameters:C259=0)
			If (Test path name:C476($_t_ApplicationPath)=Is a document:K24:1)
				$_t_ApplicationPath:=$_t_ApplicationPath+Folder separator:K24:12+"Database"
				If (Test path name:C476($_t_ApplicationPath)=Is a folder:K24:2)
					DOCUMENT LIST:C474($_t_ApplicationPath; $_at_DocumentPaths)
					$_l_Index:=1
					While (($_l_Index<=Size of array:C274($_at_DocumentPaths)) & (Test path name:C476($_t_StructurePath)#Is a document:K24:1))
						If ($_at_DocumentPaths{$_l_Index}="@.4DC")
							$_t_StructurePath:=$_t_ApplicationPath+Folder separator:K24:12+$_at_DocumentPaths{$_l_Index}
						End if 
						$_l_Index:=$_l_Index+1
					End while 
				End if 
			End if 
		Else 
			
			Case of 
				: ($_t_PathOption="RSR") | ($_t_PathOption="WIN4DX")
					$_t_StructurePath:=$_t_ApplicationPath+Folder separator:K24:12+"Database"
				: ($_t_PathOption="PLUGINS")
					$_t_StructurePath:=$_t_ApplicationPath
					
			End case 
			
		End if 
		
		//
	Else 
		$_t_StructurePath:=Structure file:C489
End case 

$0:=$_t_StructurePath
ERR_MethodTrackerReturn("StructureFilePath"; $_t_oldMethodName)