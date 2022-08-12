//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_TimeZone_LoadFromDisk
	//------------------ Method Notes ------------------
	//*****************************************************************************
	// //
	// //  Cal4D_TimeZone_LoadFromDisk
	// //
	// //  Written by Charles Vass - 08/24/2009, 08:18
	// //
	// //  Purpose:
	// //
	// //  $1 - type - purpose
	// //
	// //
	//*****************************************************************************
	
	//method_parameters_declarations
	//--------------------------------------------------------------------------------
	//method_wide_constants_declarations
	//--------------------------------------------------------------------------------
	//local_variable_declarations
	
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2009 18:18`Method: Cal4D_TimeZone_LoadFromDisk
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $_l_XmlElements)
	C_TEXT:C284($_t_ChildName; $_t_elementName; $_t_ElementRef; $_t_oldMethodName; $_t_UserName; $_t_value; $_t_xmlChild; $_t_xmlRoot; $_t_XMLtimeZonePath; $_t_xmlUser; $_t_XmlUserElementName)
	C_TEXT:C284($1; CAL_T_UserTimeZone)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_TimeZone_LoadFromDisk")
//TRACE
CAL_T_UserTimeZone:=""
$_t_XMLtimeZonePath:=Get 4D folder:C485(Current resources folder:K5:16)+"TimeZone.xml"
If (Test path name:C476($_t_XMLtimeZonePath)=Is a document:K24:1)
	
	//========================    Method Actions    ==================================
	
	$_t_xmlRoot:=DOM Parse XML source:C719($_t_XMLtimeZonePath)
	If (OK=1)
		If (True:C214)
			$_t_UserName:=$1
			
			$_l_XmlElements:=DOM Count XML elements:C726($_t_xmlRoot; "user")
			For ($_l_Index; 1; $_l_XmlElements)
				$_t_xmlUser:=DOM Get XML element:C725($_t_xmlRoot; "user"; $_l_Index; $_t_XmlUserElementName)
				$_t_xmlChild:=DOM Get first child XML element:C723($_t_xmlUser; $_t_ChildName; $_t_XmlUserElementName)
				If ($_t_XmlUserElementName=$_t_UserName)
					$_t_elementName:="timeZone/user["+String:C10($_l_Index)+"]/zone"
					$_t_ElementRef:=DOM Find XML element:C864($_t_xmlRoot; $_t_elementName)
					If (OK=1)
						$_t_value:=""
						DOM GET XML ATTRIBUTE BY NAME:C728($_t_ElementRef; "name"; $_t_value)
						CAL_T_UserTimeZone:=$_t_value+":"
						
						$_t_value:=""
						DOM GET XML ATTRIBUTE BY NAME:C728($_t_ElementRef; "letter"; $_t_value)
						CAL_T_UserTimeZone:=CAL_T_UserTimeZone+$_t_value+":"
						
						$_t_value:=""
						DOM GET XML ATTRIBUTE BY NAME:C728($_t_ElementRef; "observing"; $_t_value)
						CAL_T_UserTimeZone:=CAL_T_UserTimeZone+$_t_value+":"
						
						$_t_value:=""
						DOM GET XML ATTRIBUTE BY NAME:C728($_t_ElementRef; "zoneAbbr"; $_t_value)
						CAL_T_UserTimeZone:=CAL_T_UserTimeZone+$_t_value+":"
						
						$_t_value:=""
						DOM GET XML ATTRIBUTE BY NAME:C728($_t_ElementRef; "offset"; $_t_value)
						CAL_T_UserTimeZone:=CAL_T_UserTimeZone+$_t_value
					End if 
					
				End if 
				
			End for 
			
		Else 
			// *** Load all account elements
			$_t_elementName:="timeZone/zone"
			$_t_ElementRef:=DOM Find XML element:C864($_t_xmlRoot; $_t_elementName)
			If (OK=1)
				$_t_value:=""
				DOM GET XML ATTRIBUTE BY NAME:C728($_t_ElementRef; "name"; $_t_value)
				CAL_T_UserTimeZone:=$_t_value+":"
				
				$_t_value:=""
				DOM GET XML ATTRIBUTE BY NAME:C728($_t_ElementRef; "letter"; $_t_value)
				CAL_T_UserTimeZone:=CAL_T_UserTimeZone+$_t_value+":"
				
				$_t_value:=""
				DOM GET XML ATTRIBUTE BY NAME:C728($_t_ElementRef; "observing"; $_t_value)
				CAL_T_UserTimeZone:=CAL_T_UserTimeZone+$_t_value+":"
				
				$_t_value:=""
				DOM GET XML ATTRIBUTE BY NAME:C728($_t_ElementRef; "zoneAbbr"; $_t_value)
				CAL_T_UserTimeZone:=CAL_T_UserTimeZone+$_t_value+":"
				
				$_t_value:=""
				DOM GET XML ATTRIBUTE BY NAME:C728($_t_ElementRef; "offset"; $_t_value)
				CAL_T_UserTimeZone:=CAL_T_UserTimeZone+$_t_value
			End if 
			
		End if 
		
		DOM CLOSE XML:C722($_t_xmlRoot)
		
	End if 
	
	//========================    Clean up and Exit    =================================
	
End if 
ERR_MethodTrackerReturn("Cal4D_TimeZone_LoadFromDisk"; $_t_oldMethodName)