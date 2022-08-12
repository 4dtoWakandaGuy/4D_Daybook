//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_WeekStart_LoadFromDisk
	//------------------ Method Notes ------------------
	//*****************************************************************************
	// //
	// //  Cal4D_WeekStart_LoadFromDisk
	// //
	// //  Written by Charles Vass - 08/24/2009, 08:52
	// //
	// //  Purpose:
	// //
	// //  $1 - type - purpose
	// //
	// //
	//*****************************************************************************
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 15:28`Method: Cal4D_WeekStart_LoadFromDisk
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $_l_XmlElements)
	C_TEXT:C284($_l_XmlUserNameValue; $_t_ChildName; $_t_elementName; $_t_ElementRef; $_t_oldMethodName; $_t_UserName; $_t_xmlChild; $_t_XMLElementRef; $_t_xmlRoot; $_t_XMLtimeZonePath; $_t_xmlUser)
	C_TEXT:C284($1; CAL_t_CalWeekStart)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_WeekStart_LoadFromDisk")
$_t_XMLtimeZonePath:=Get 4D folder:C485(Current resources folder:K5:16)+"TimeZone.xml"
If (Test path name:C476($_t_XMLtimeZonePath)=Is a document:K24:1)
	
	//========================    Method Actions    ==================================
	
	$_t_XMLRoot:=DOM Parse XML source:C719($_t_XMLtimeZonePath)
	If (OK=1)
		If (True:C214)
			$_t_UserName:=$1
			CAL_t_CalWeekStart:=""
			
			$_l_XmlElements:=DOM Count XML elements:C726($_t_XMLRoot; "user")
			For ($_l_Index; 1; $_l_XmlElements)
				$_t_xmlUser:=DOM Get XML element:C725($_t_XMLRoot; "user"; $_l_Index; $_l_XmlUserNameValue)
				
				$_t_xmlChild:=DOM Get first child XML element:C723($_t_xmlUser; $_t_ChildName; $_l_XmlUserNameValue)
				If ($_l_XmlUserNameValue=$_t_UserName)
					$_t_elementName:="timeZone/user["+String:C10($_l_Index)+"]/weekStart"
					$_t_ElementRef:=DOM Find XML element:C864($_t_XMLRoot; $_t_elementName)
					If (OK=1)
						
						CAL_t_CalWeekStart:=""
						DOM GET XML ATTRIBUTE BY NAME:C728($_t_ElementRef; "day"; CAL_t_CalWeekStart)
						
					End if 
					
				End if 
				
			End for 
			
		Else 
			// *** Load all account elements
			$_t_elementName:="timeZone/weekStart"
			$_t_XMLElementRef:=DOM Find XML element:C864($_t_XMLRoot; $_t_elementName)
			If (OK=1)
				
				CAL_t_CalWeekStart:=""
				DOM GET XML ATTRIBUTE BY NAME:C728($_t_XMLElementRef; "day"; CAL_t_CalWeekStart)
				
			End if 
			
		End if 
		
		DOM CLOSE XML:C722($_t_XMLRoot)
		
	End if 
	
	//========================    Clean up and Exit    =================================
	
End if 
ERR_MethodTrackerReturn("Cal4D_WeekStart_LoadFromDisk"; $_t_oldMethodName)