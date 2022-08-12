//%attributes = {}

If (False:C215)
	//Project Method Name:      UTIL_GetDocumentNameFromPath
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  27/01/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>UNIT_bo_UnitTesting)
	C_LONGINT:C283($_l_CurrentCharPosition; $_l_Platformproperties; $_l_SeperatorPosition)
	C_TEXT:C284($_t_DocumentPath; $0; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("UTIL_GetDocumentNameFromPath")
If (False:C215)
	//-------------------- Method Set Up -------------------
	//Project Method Name:      UTIL_GetDocumentNameFromPath
	//Parameter Detail:
	//------------------ Method Narrative ------------------
	
	//------------------ Methods/Table List ----------------
	
	//Table(If any): 
	
	//Module: 
	
	//Calling Menu/Method/Form/Object Method: 
	//
	//Related Methods: 
	
	//
	//------------------ Assumptions ----------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/08/2016
	//Created BY: Nigel Greenlee
	
	//////21/03/2017
	//Modified By: Nigel Greenlee
	
End if 
//---------- Type Parameters & Local Variables ----------
If (True:C214)
End if 
//---------- Reassign Passed Parameters OR get values ----------

If (Count parameters:C259>=1)
	$_t_DocumentPath:=$1
Else 
	
	//UNIT_TESTINGINIT (Current method name)
	
	If (<>UNIT_bo_UnitTesting)
		
	End if 
	
End if 

//-------------------- Main Method -------------------


_O_PLATFORM PROPERTIES:C365($_l_Platformproperties)

Case of 
	: ($_l_Platformproperties#3)  //MAC
		If ($_t_DocumentPath#"")
			If ($_t_DocumentPath[[Length:C16($_t_DocumentPath)]]=":")
				$_t_DocumentPath:=Substring:C12($_t_DocumentPath; 1; Length:C16($_t_DocumentPath)-1)
				
			End if 
			$_l_SeperatorPosition:=Position:C15(":"; $_t_DocumentPath)
			If ($_l_SeperatorPosition>0)
				For ($_l_CurrentCharPosition; Length:C16($_t_DocumentPath); 0; -1)
					If ($_t_DocumentPath[[$_l_CurrentCharPosition]]=":")  //FILE SEPERATOR
						$0:=Substring:C12($_t_DocumentPath; $_l_CurrentCharPosition+1; Length:C16($_t_DocumentPath))
						$_l_CurrentCharPosition:=0
					End if 
				End for 
			Else 
				//-the path passed could be posix or windows!
				$_l_SeperatorPosition:=Position:C15("\\"; $_t_DocumentPath)  //WIndows
				If ($_l_SeperatorPosition>0)
					For ($_l_CurrentCharPosition; Length:C16($_t_DocumentPath); 0; -1)
						If ($_t_DocumentPath[[$_l_CurrentCharPosition]]="\\")  //FILE SEPERATOR
							$0:=Substring:C12($_t_DocumentPath; $_l_CurrentCharPosition+1; Length:C16($_t_DocumentPath))
							$_l_CurrentCharPosition:=0
						End if 
					End for 
				Else 
					$_l_SeperatorPosition:=Position:C15("/"; $_t_DocumentPath)  //unix(posix
					If ($_l_SeperatorPosition>0)
						For ($_l_CurrentCharPosition; Length:C16($_t_DocumentPath); 0; -1)
							If ($_t_DocumentPath[[$_l_CurrentCharPosition]]="\\")  //FILE SEPERATOR
								$0:=Substring:C12($_t_DocumentPath; $_l_CurrentCharPosition+1; Length:C16($_t_DocumentPath))
								$_l_CurrentCharPosition:=0
							End if 
						End for 
					Else 
						$0:=$_t_DocumentPath
					End if 
				End if 
			End if 
		Else 
			$0:=$_t_DocumentPath
		End if 
	Else 
		If ($_t_DocumentPath#"")
			$_l_SeperatorPosition:=Position:C15("\\"; $_t_DocumentPath)
			If ($_l_SeperatorPosition>0)
				For ($_l_CurrentCharPosition; Length:C16($_t_DocumentPath); 0; -1)
					If ($_t_DocumentPath[[$_l_CurrentCharPosition]]="\\")  //FILE SEPERATOR
						$0:=Substring:C12($_t_DocumentPath; $_l_CurrentCharPosition+1; Length:C16($_t_DocumentPath))
						$_l_CurrentCharPosition:=0
					End if 
				End for 
			Else 
				//the path passed could be mac or posix(Unix)
				
				$_l_SeperatorPosition:=Position:C15(":"; $_t_DocumentPath)  //WIndows
				If ($_l_SeperatorPosition>0)
					For ($_l_CurrentCharPosition; Length:C16($_t_DocumentPath); 0; -1)
						If ($_t_DocumentPath[[$_l_CurrentCharPosition]]=":")  //FILE SEPERATOR
							$0:=Substring:C12($_t_DocumentPath; $_l_CurrentCharPosition+1; Length:C16($_t_DocumentPath))
							$_l_CurrentCharPosition:=0
						End if 
					End for 
				Else 
					$_l_SeperatorPosition:=Position:C15("/"; $_t_DocumentPath)  //unix(posix
					If ($_l_SeperatorPosition>0)
						For ($_l_CurrentCharPosition; Length:C16($_t_DocumentPath); 0; -1)
							If ($_t_DocumentPath[[$_l_CurrentCharPosition]]="\\")  //FILE SEPERATOR
								$0:=Substring:C12($_t_DocumentPath; $_l_CurrentCharPosition+1; Length:C16($_t_DocumentPath))
								$_l_CurrentCharPosition:=0
							End if 
						End for 
					Else 
						$0:=$_t_DocumentPath
					End if 
				End if 
				
			End if 
		Else 
			$0:=$_t_DocumentPath
		End if 
End case 
ERR_MethodTrackerReturn("UTIL_GetDocumentNameFromPath"; $_t_oldMethodName)