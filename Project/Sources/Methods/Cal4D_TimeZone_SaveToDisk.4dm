//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_TimeZone_SaveToDisk
	//------------------ Method Notes ------------------
	//*****************************************************************************
	// //
	// //  Cal4D_TimeZone_SaveToDisk
	// //
	// //  Written by Charles Vass - 08/24/2009, 07:42
	// //
	// //  Purpose:
	// //
	// //  $1 - type - purpose
	// //
	// //
	//*****************************************************************************
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 17:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $_l_XmlElements)
	C_TEXT:C284(<>CAL_t_CalWeekStart; $_t_ChildName; $_t_elementName; $_t_ElementRef; $_t_MethodName; $_t_oldMethodName; $_t_UserName; $_t_value; $_t_xmlChild; $_t_XMLElementRef2; $_t_xmlRoot)
	C_TEXT:C284($_t_XMLtimeZonePath; $_t_xmlUser; $_t_XMLUserName; $1; CAL_T_UserTimeZone)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_TimeZone_SaveToDisk")

$_t_XMLtimeZonePath:=Get 4D folder:C485(Current resources folder:K5:16)
If (Test path name:C476($_t_XMLtimeZonePath)#Is a folder:K24:2)
	CREATE FOLDER:C475($_t_XMLtimeZonePath)
End if 
$_t_XMLtimeZonePath:=$_t_XMLtimeZonePath+"TimeZone.xml"

$_t_UserName:=$1
$_t_ElementRef:=""

//========================    Method Actions    ==================================

If (Test path name:C476($_t_XMLtimeZonePath)=Is a document:K24:1)
	$_t_XMLRoot:=DOM Parse XML source:C719($_t_XMLtimeZonePath)
	If (DOM_ReferenceIsValid($_t_XMLRoot))
		
		$_l_XmlElements:=DOM Count XML elements:C726($_t_XMLRoot; "user")
		For ($_l_Index; 1; $_l_XmlElements)
			$_t_xmlUser:=DOM Get XML element:C725($_t_XMLRoot; "user"; $_l_Index; $_t_XMLUserName)
			$_t_xmlChild:=DOM Get first child XML element:C723($_t_xmlUser; $_t_ChildName; $_t_XMLUserName)
			If (DOM_ReferenceIsValid($_t_xmlChild) & ($_t_XMLUserName=$_t_UserName))
				$_t_elementName:="timeZone/user["+String:C10($_l_Index)+"]/zone"
				$_t_ElementRef:=DOM Find XML element:C864($_t_XMLRoot; $_t_elementName)
				If (DOM_ReferenceIsValid($_t_ElementRef))
					
					DOM SET XML ATTRIBUTE:C866($_t_ElementRef; "name"; CAL4D_STR_Parse(CAL_T_UserTimeZone; 1; ":"))
					DOM SET XML ATTRIBUTE:C866($_t_ElementRef; "letter"; CAL4D_STR_Parse(CAL_T_UserTimeZone; 2; ":"))
					DOM SET XML ATTRIBUTE:C866($_t_ElementRef; "observing"; CAL4D_STR_Parse(CAL_T_UserTimeZone; 3; ":"))
					DOM SET XML ATTRIBUTE:C866($_t_ElementRef; "zoneAbbr"; CAL4D_STR_Parse(CAL_T_UserTimeZone; 4; ":"))
					DOM SET XML ATTRIBUTE:C866($_t_ElementRef; "offset"; CAL4D_STR_Parse(CAL_T_UserTimeZone; 5; ":"))
					
				End if 
				$_l_Index:=$_l_XmlElements
			End if 
		End for 
		
		If ($_t_XMLUserName#$_t_UserName)
			$_t_XMLElementRef2:=DOM Create XML element:C865($_t_XMLRoot; "timeZone/user["+String:C10($_l_Index)+"]")
			If (DOM_ReferenceIsValid($_t_XMLRoot))
				$_t_ElementRef:=DOM Create XML element:C865($_t_XMLElementRef2; "name")
				If (DOM_ReferenceIsValid($_t_XMLRoot))
					DOM SET XML ELEMENT VALUE:C868($_t_ElementRef; $_t_UserName)
					
					$_t_ElementRef:=DOM Create XML element:C865($_t_XMLElementRef2; "zone")
					If (DOM_ReferenceIsValid($_t_XMLRoot))
						
						DOM SET XML ATTRIBUTE:C866($_t_ElementRef; "name"; CAL4D_STR_Parse(CAL_T_UserTimeZone; 1; ":"))
						DOM SET XML ATTRIBUTE:C866($_t_ElementRef; "letter"; CAL4D_STR_Parse(CAL_T_UserTimeZone; 2; ":"))
						DOM SET XML ATTRIBUTE:C866($_t_ElementRef; "observing"; CAL4D_STR_Parse(CAL_T_UserTimeZone; 3; ":"))
						DOM SET XML ATTRIBUTE:C866($_t_ElementRef; "zoneAbbr"; CAL4D_STR_Parse(CAL_T_UserTimeZone; 4; ":"))
						DOM SET XML ATTRIBUTE:C866($_t_ElementRef; "offset"; CAL4D_STR_Parse(CAL_T_UserTimeZone; 5; ":"))
						
						$_t_ElementRef:=DOM Create XML element:C865($_t_XMLElementRef2; "weekStart")
						If (DOM_ReferenceIsValid($_t_XMLRoot))
							DOM SET XML ATTRIBUTE:C866($_t_ElementRef; "day"; <>CAL_t_CalWeekStart)
							
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
	
Else 
	$_t_XMLRoot:=DOM Create XML Ref:C861("timeZone")
	If (DOM_ReferenceIsValid($_t_XMLRoot))
		
		DOM SET XML DECLARATION:C859($_t_XMLRoot; "UTF-8"; True:C214)
		
		$_t_XMLElementRef2:=DOM Create XML element:C865($_t_XMLRoot; "zone")
		If (DOM_ReferenceIsValid($_t_XMLElementRef2))
			
			DOM SET XML ATTRIBUTE:C866($_t_XMLElementRef2; "name"; CAL4D_STR_Parse(CAL_T_UserTimeZone; 1; ":"))
			DOM SET XML ATTRIBUTE:C866($_t_XMLElementRef2; "letter"; CAL4D_STR_Parse(CAL_T_UserTimeZone; 2; ":"))
			DOM SET XML ATTRIBUTE:C866($_t_XMLElementRef2; "observing"; CAL4D_STR_Parse(CAL_T_UserTimeZone; 3; ":"))
			DOM SET XML ATTRIBUTE:C866($_t_XMLElementRef2; "zoneAbbr"; CAL4D_STR_Parse(CAL_T_UserTimeZone; 4; ":"))
			DOM SET XML ATTRIBUTE:C866($_t_XMLElementRef2; "offset"; CAL4D_STR_Parse(CAL_T_UserTimeZone; 5; ":"))
			
		End if 
		
		$_t_XMLElementRef2:=DOM Create XML element:C865($_t_XMLRoot; "weekStart")
		If (DOM_ReferenceIsValid($_t_XMLElementRef2))
			
			DOM SET XML ATTRIBUTE:C866($_t_XMLElementRef2; "day"; <>CAL_t_CalWeekStart)
			
		End if 
		
	End if 
	
End if 

//========================    Clean up and Exit    =================================

If (DOM_ReferenceIsValid($_t_XMLRoot))
	
	DOM EXPORT TO FILE:C862($_t_XMLRoot; $_t_XMLtimeZonePath)
	DOM CLOSE XML:C722($_t_XMLRoot)
	
End if 
ERR_MethodTrackerReturn("Cal4D_TimeZone_SaveToDisk"; $_t_oldMethodName)