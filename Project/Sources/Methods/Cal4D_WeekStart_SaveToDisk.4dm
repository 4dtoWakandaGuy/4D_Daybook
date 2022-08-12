//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_WeekStart_SaveToDisk
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 15:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $_l_XmlElements)
	C_TEXT:C284($_t_ChildName; $_t_ElementName; $_t_MethodName; $_t_Name; $_t_oldMethodName; $_t_UserName; $_t_XMLChild; $_t_XMLElementRef; $_t_XMLRoot; $_t_XMLtimeZonePath; $_t_XMLUser)
	C_TEXT:C284($1; CAL_t_CalWeekStart)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_WeekStart_SaveToDisk")

$_t_XMLtimeZonePath:=Get 4D folder:C485(Current resources folder:K5:16)
If (Test path name:C476($_t_XMLtimeZonePath)#Is a folder:K24:2)
	CREATE FOLDER:C475($_t_XMLtimeZonePath)
End if 
$_t_XMLtimeZonePath:=$_t_XMLtimeZonePath+"TimeZone.xml"

$_t_UserName:=$1
$_t_XMLElementRef:=""

//========================    Method Actions    ==================================

If (Test path name:C476($_t_XMLtimeZonePath)=Is a document:K24:1)
	$_t_XMLRoot:=DOM Parse XML source:C719($_t_XMLtimeZonePath)
	If (DOM_ReferenceIsValid($_t_XMLRoot))
		$_l_XmlElements:=DOM Count XML elements:C726($_t_XMLRoot; "user")
		For ($_l_Index; 1; $_l_XmlElements)
			$_t_XMLUser:=DOM Get XML element:C725($_t_XMLRoot; "user"; $_l_Index; $_t_Name)
			$_t_XMLChild:=DOM Get first child XML element:C723($_t_XMLUser; $_t_ChildName; $_t_Name)
			If (DOM_ReferenceIsValid($_t_XMLChild) & ($_t_Name=$_t_UserName))
				$_t_ElementName:="timeZone/user["+String:C10($_l_Index)+"]/weekStart"
				$_t_XMLElementRef:=DOM Find XML element:C864($_t_XMLRoot; $_t_ElementName)
				If (DOM_ReferenceIsValid($_t_XMLElementRef))
					
					DOM SET XML ATTRIBUTE:C866($_t_XMLElementRef; "day"; CAL_t_CalWeekStart)
					
				End if 
				$_l_Index:=$_l_XmlElements
			End if 
		End for 
		
		If ($_t_Name#$_t_UserName)
			Cal4D_TimeZone_SaveToDisk($_t_UserName)
		End if 
	End if 
	
	If (DOM_ReferenceIsValid($_t_XMLRoot))
		
		DOM EXPORT TO FILE:C862($_t_XMLRoot; $_t_XMLtimeZonePath)
		DOM CLOSE XML:C722($_t_XMLRoot)
		
	End if 
	
Else 
	Cal4D_TimeZone_SaveToDisk(Cal4D_User_Name)
	
End if 

//========================    Clean up and Exit    =================================
ERR_MethodTrackerReturn("Cal4D_WeekStart_SaveToDisk"; $_t_oldMethodName)