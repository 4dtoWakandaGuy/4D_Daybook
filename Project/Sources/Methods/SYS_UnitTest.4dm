//%attributes = {}

If (False:C215)
	//Project Method Name:      SYS_UnitTest
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  18/03/2022
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_MethodLength; 0)
	ARRAY TEXT:C222($_al_ParameterType; 0)
	ARRAY TEXT:C222($_at_DocumentPaths; 0)
	ARRAY TEXT:C222($_at_Parameters; 0)
	ARRAY TEXT:C222($_at_ParameterTypeName; 0)
	C_BOOLEAN:C305($_bo_Exit; $_bo_DataOpen; $_bo_Exit)
	C_LONGINT:C283($_l_Fails; $_l_Index; $_l_Length; $_l_Method; $_l_Param; $_l_pos; $_l_pos2; $_l_Fails; $_l_Index; $_l_Length; $_l_Method)
	C_LONGINT:C283($_l_Param; $_l_pos; $_l_pos2; $_l_Pos3)
	C_OBJECT:C1216($_obj_TestParameters)
	C_TEXT:C284($_t_Before; $_t_DocumentPath; $_t_ParametersJSON; $_t_SourceCode; $_t_StructurePath; $_t_Before; $_t_DocumentPath; $_t_ParametersJSON; $_t_SourceCode; $_t_StructurePath)
	C_TIME:C306($_ti_Doc; $_ti_ParametersDocument; $_ti_ParametersDocument)
End if 
//Code Starts Here
ARRAY TEXT:C222($_at_DocumentPaths; 0)
METHOD GET PATHS:C1163(Path project method:K72:1; $_at_DocumentPaths)
SORT ARRAY:C229($_at_DocumentPaths)
ARRAY LONGINT:C221($_al_MethodLength; 0)
For ($_l_Method; 1; Size of array:C274($_at_DocumentPaths))
	$_l_Length:=Length:C16($_at_DocumentPaths{$_l_Method})
	APPEND TO ARRAY:C911($_al_MethodLength; $_l_Length)
End for 

If (Application type:C494#4D Remote mode:K5:5)
	$_t_StructurePath:=Get 4D folder:C485(Database folder:K5:14)
	
Else 
	$_t_StructurePath:=Get 4D folder:C485(4D Client database folder:K5:13)
End if 
If (Not:C34(Test path name:C476($_t_StructurePath+"Resources"+Folder separator:K24:12+"Data")=Is a folder:K24:2))
	If (Not:C34(Test path name:C476($_t_StructurePath+"Resources")=Is a folder:K24:2))
		CREATE FOLDER:C475($_t_StructurePath+"Resources")
	End if 
	If (Not:C34(Test path name:C476($_t_StructurePath+"Resources"+Folder separator:K24:12+"Data")=Is a folder:K24:2))
		CREATE FOLDER:C475($_t_StructurePath+"Resources"+Folder separator:K24:12+"Data")
	End if 
End if 
$_t_DocumentPath:=$_t_StructurePath+"Resources"+Folder separator:K24:12+"Data"+Folder separator:K24:12+"TestParameters"+".txt"
$_obj_TestParameters:=New object:C1471
If (Test path name:C476($_t_DocumentPath)=Is a document:K24:1)
	$_bo_DataOpen:=False:C215
	$_ti_ParametersDocument:=Open document:C264($_t_DocumentPath; "txt"; Read mode:K24:5)
	RECEIVE PACKET:C104($_ti_ParametersDocument; $_t_ParametersJSON; 3200000)
	$_obj_TestParameters:=JSON Parse:C1218($_t_ParametersJSON)
	
End if 




For ($_l_Method; 1; Size of array:C274($_at_DocumentPaths))
	If ($_bo_DataOpen)
		If (Not:C34($_obj_TestParameters.testparameters=Null:C1517))
			$_l_Index:=$_obj_TestParameters.testparameters.methodName.indexOf($_at_DocumentPaths{$_l_Method})
		End if 
	Else 
		CONFIRM:C162("Do you want to set the tests for "+$_at_DocumentPaths{$_l_Method}; "Yes"; "No")
		If (OK=1)
			METHOD GET CODE:C1190($_at_DocumentPaths{$_l_Method}; $_t_SourceCode)
			ARRAY TEXT:C222($_at_Parameters; 0)
			ARRAY TEXT:C222($_at_ParameterTypeName; 0)
			ARRAY TEXT:C222($_al_ParameterType; 0)
			$_bo_Exit:=False:C215
			$_l_Param:=1
			$_l_Fails:=0
			Repeat 
				$_l_pos:=Position:C15("$"+String:C10($_l_Param); $_t_SourceCode)
				If ($_l_Pos>0)
					$_l_Fails:=0
					APPEND TO ARRAY:C911($_at_Parameters; "$"+String:C10($_l_Param))
					$_t_Before:=Substring:C12($_t_SourceCode; 1; $_l_Pos)
					$_l_pos2:=Length:C16($_t_Before)
					Repeat 
						If (Substring:C12($_t_Before; $_l_pos2)="C_@")
							$_t_Before:=Substring:C12($_t_Before; $_l_pos2)
							$_l_Pos3:=Position:C15("("; $_t_Before)
							$_l_pos2:=0
							APPEND TO ARRAY:C911($_at_ParameterTypeName; Substring:C12($_t_Before; 1; $_l_Pos3-1))
							
						Else 
							$_l_pos2:=$_l_pos2-1
						End if 
					Until ($_l_pos2<=0)
					
					
				Else 
					$_l_Fails:=$_l_Fails+1
				End if 
				$_l_Param:=$_l_Param+1
				If ($_l_Fails>10)
					$_bo_Exit:=True:C214
				End if 
			Until ($_bo_Exit)
			TRACE:C157
			
		End if 
		
		
	End if 
	
End for 



