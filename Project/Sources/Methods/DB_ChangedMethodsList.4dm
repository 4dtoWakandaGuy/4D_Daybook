//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ChangedMethodsList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/08/2012 16:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_Dates; 0)
	ARRAY TEXT:C222($_at_Details; 0)
	ARRAY TEXT:C222($_at_DocumentNames; 0)
	C_BOOLEAN:C305($_bo_CanUnitTest; $_bo_Invisible; $_bo_Locked; DB_bo_UNITTEST)
	C_DATE:C307($_d_CreatedOn; $_d_ModifiedOn; $_d_StartDate)
	C_LONGINT:C283($_l_Index; $_l_Position)
	C_TEXT:C284($_t_Databasepath; $_t_DocumentNameNoExtension; $_t_oldMethodName; $_t_VersionNumber)
	C_TIME:C306($_ti_CreatedAt; $_ti_DocumentRef; $_ti_ModifiedAt)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ChangedMethodsList")

$_t_VersionNumber:=VER_GetVersion
$_t_VersionNumber:=Replace string:C233($_t_VersionNumber; ":"; "")
$_t_VersionNumber:=Replace string:C233($_t_VersionNumber; "/"; "_")
$_t_VersionNumber:=Replace string:C233($_t_VersionNumber; "\\"; "_")
$_t_VersionNumber:=Replace string:C233($_t_VersionNumber; "."; "_")
$_t_Databasepath:=Get 4D folder:C485(4)
$_t_Databasepath:=$_t_Databasepath+"CODEEXPORTS"
If (Not:C34(Test path name:C476($_t_Databasepath)=0))
	CREATE FOLDER:C475($_t_Databasepath)
End if 
DOCUMENT LIST:C474($_t_Databasepath; $_at_DocumentNames)
SORT ARRAY:C229($_at_DocumentNames)
$_ti_DocumentRef:=Create document:C266(""; "TEXT")
ARRAY TEXT:C222($_at_Details; 0)
ARRAY DATE:C224($_ad_Dates; 0)
$_d_StartDate:=Gen_RequestDate("Enter Date to Start From"; Is date:K8:7; !00-00-00!; "Continue"; "Stop")
If (OK=0)
	For ($_l_Index; 1; Size of array:C274($_at_DocumentNames))
		If ($_at_DocumentNames{$_l_Index}#"")
			If ($_at_DocumentNames{$_l_Index}[[1]]#".") & ($_at_DocumentNames{$_l_Index}[[1]]#"_")
				$_l_Position:=Position:C15("_2010"; $_at_DocumentNames{$_l_Index})
				If ($_l_Position=0)
					$_l_Position:=Position:C15("_2011"; $_at_DocumentNames{$_l_Index})
					If ($_l_Position=0)
						$_l_Position:=Position:C15("_2012"; $_at_DocumentNames{$_l_Index})
						If ($_l_Position=0)
							$_l_Position:=Position:C15("_2013"; $_at_DocumentNames{$_l_Index})
						End if 
					End if 
				End if 
				
				If ($_l_Position=0)
					//Folder separator:=Folder separator
					$_t_DocumentNameNoExtension:=Replace string:C233($_at_DocumentNames{$_l_Index}; ".txt"; "")
					
					GET DOCUMENT PROPERTIES:C477($_t_Databasepath+Folder separator:K24:12+$_at_DocumentNames{$_l_Index}; $_bo_Locked; $_bo_Invisible; $_d_CreatedOn; $_ti_CreatedAt; $_d_ModifiedOn; $_ti_ModifiedAt)
					If ($_d_CreatedOn>=$_d_StartDate)  //SEND PACKET($_ti_DocumentRef;$_t_DocumentNameNoExtension+Char(9)+String($_d_CreatedOn)+Char(13))
						APPEND TO ARRAY:C911($_at_Details; $_t_DocumentNameNoExtension)
						APPEND TO ARRAY:C911($_ad_Dates; $_d_CreatedOn)
					End if 
					
					
				End if 
			End if 
		End if 
		
	End for 
	SORT ARRAY:C229($_ad_Dates; $_at_Details)
	For ($_l_Index; 1; Size of array:C274($_at_Details))
		$_bo_CanUnitTest:=DB_BigUnittest($_at_Details{$_l_Index})
		If ($_bo_CanUnitTest)
			DB_bo_UNITTEST:=True:C214
			EXECUTE FORMULA:C63($_at_Details{$_l_Index})
			DB_bo_UNITTEST:=False:C215
		Else 
			SEND PACKET:C103($_ti_DocumentRef; $_at_Details{$_l_Index}+Char:C90(9)+String:C10($_ad_Dates{$_l_Index})+Char:C90(13))
		End if 
	End for 
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
End if 
ERR_MethodTrackerReturn("DB_ChangedMethodsList"; $_t_oldMethodName)